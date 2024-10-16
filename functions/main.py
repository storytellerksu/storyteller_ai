# Welcome to Cloud Functions for Firebase for Python!
# To get started, simply uncomment the below code or create your own.
# Deploy with `firebase deploy`

from firebase_functions import firestore_fn, https_fn, options
from firebase_admin import initialize_app, functions, firestore, db
import google.cloud.firestore

# openai sdk
from openai import OpenAI

# for importing env
import os
from dotenv import load_dotenv

# Any allows it to accept any data type
from typing import Any
import re

# initializes cloud function, did not return api call without this
initialize_app()

# gets api key from env
load_dotenv()
client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

# creates callable function for text generation
@https_fn.on_call()
def generateText(req: https_fn.CallableRequest) -> Any:
# Message text passed from the client.
    inputText = req.data["text"]
# Authentication / user information is automatically added to the request.
    uid = req.auth.uid
#    name = req.auth.token.get("name", "")
#    picture = req.auth.token.get("picture", "")
#    email = req.auth.token.get("email", "")
    storyText = generate(inputText)
    return {"text": storyText}

# creates callable function for image generation
@https_fn.on_call()
def generateImage(req: https_fn.CallableRequest) -> Any:
# Message text passed from the client.
    inputText = req.data["text"]
# Authentication / user information is automatically added to the request.
    uid = req.auth.uid
#    name = req.auth.token.get("name", "")
#    picture = req.auth.token.get("picture", "")
#    email = req.auth.token.get("email", "")
    imageURL = generate2(inputText)
    return {"text": imageURL}

# makes api call to openai for text generation
def generate(inputText):
    response = client.chat.completions.create(model="gpt-4o-mini",
    messages=[
      {
        "role": "system",
        "content": "You are a creative storyteller who tells short stories. Write a short story that is strictly less than 150 words. After each sentence add || to denote the end of a sentence."
      },
      {
        "role": "user",
        "content": inputText
      }
    ],
    temperature=0.5,
    max_tokens=1000,
    top_p=1)
    return response.choices[0].message.content

# makes api call to openai for image generation using Dalle-3
def generate2(inputText):
  try:
    response2 = client.images.generate(
    model="dall-e-2",
              prompt=inputText,
              size="1024x1024",
              quality="standard",
              n=1,
          )
    return response2.data[0].url
  except Exception as e:
      print(f"Error generating image for sentence '{inputText}': {str(e)}")
      return "https://dummyimage.com/300"