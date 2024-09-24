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

initialize_app()
# creates callable function
@https_fn.on_call()
def generateText(req: https_fn.CallableRequest) -> Any:
# Message text passed from the client.
    text = req.data["text"]
# Authentication / user information is automatically added to the request.
    uid = req.auth.uid
#    name = req.auth.token.get("name", "")
#    picture = req.auth.token.get("picture", "")
#    email = req.auth.token.get("email", "")
    return {"text": generate}

load_dotenv()
client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

def generate():
    response = client.chat.completions.create(model="gpt-4o-mini",
    messages=[
      {
        "role": "system",
        "content": "You are a creative storyteller who tells short stories. Write a short story that is strictly less than 500 words."
      },
      {
        "role": "user",
        "content": "Tell me a extremely long story about a idiot knight and a strong beast."
      }
    ],
    temperature=0.9,
    max_tokens=1000,
    top_p=1)
    return response.choices[0].message.content

# initialize_app()
#
#
# @https_fn.on_request()
# def on_request_example(req: https_fn.Request) -> https_fn.Response:
#     return https_fn.Response("Hello world!")