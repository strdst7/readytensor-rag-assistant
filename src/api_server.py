from fastapi import FastAPI
from pydantic import BaseModel
from src.rag_pipeline import load_pipeline

app = FastAPI(title="Ready Tensor RAG Assistant API")

qa = load_pipeline()  # Load the RAG pipeline

class Query(BaseModel):
    question: str

@app.post("/query")
async def ask_question(request: Query):
    result = qa(request.question)
    return {"answer": result["result"]}

@app.get("/")
def root():
    return {"message": "✅ Ready Tensor RAG Assistant API with RAG pipeline is running."}
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI(title="Ready Tensor RAG Assistant API")

class Query(BaseModel):
    question: str

@app.post("/query")
async def ask_question(request: Query):
    return {"answer": f"You asked: {request.question}"}

@app.get("/")
def root():
    return {"message": "✅ Ready Tensor RAG Assistant API is running."}



