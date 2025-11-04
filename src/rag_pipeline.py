"""
RAG Pipeline for Ready Tensor Assistant
---------------------------------------
Handles document ingestion, embedding, retrieval, and response generation.
"""

from langchain.embeddings import OpenAIEmbeddings
from langchain.vectorstores import Chroma
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain.document_loaders import DirectoryLoader, TextLoader
from langchain.chat_models import ChatOpenAI
from langchain.chains import RetrievalQA
import os
from dotenv import load_dotenv

# ✅ Load .env variables
load_dotenv()

OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")
if not OPENAI_API_KEY:
    raise ValueError("⚠️ OPENAI_API_KEY environment variable not set!")

# ✅ Define paths
DATA_PATH = "data/"
DB_PATH = "vectorstore/"

# ✅ Initialize embeddings & vector store
def load_vectorstore():
    print("📂 Loading documents and creating embeddings...")

    loader = DirectoryLoader(DATA_PATH, glob="**/*.txt", loader_cls=TextLoader)
    docs = loader.load()

    text_splitter = RecursiveCharacterTextSplitter(chunk_size=1000, chunk_overlap=200)
    splits = text_splitter.split_documents(docs)

    embeddings = OpenAIEmbeddings(openai_api_key=OPENAI_API_KEY)
    vectordb = Chroma.from_documents(splits, embedding=embeddings, persist_directory=DB_PATH)
    vectordb.persist()

    print("✅ Vectorstore created successfully!")
    return vectordb


# ✅ Build the RAG chain
def load_pipeline():
    print("🚀 Loading RAG pipeline...")

    # Use existing vectorstore if available
    vectordb = Chroma(persist_directory=DB_PATH, embedding_function=OpenAIEmbeddings(openai_api_key=OPENAI_API_KEY))

    retriever = vectordb.as_retriever(search_kwargs={"k": 3})
    llm = ChatOpenAI(model="gpt-3.5-turbo", temperature=0, openai_api_key=OPENAI_API_KEY)

    qa_chain = RetrievalQA.from_chain_type(
        llm=llm,
        retriever=retriever,
        chain_type="stuff",
        return_source_documents=True
    )

    print("✅ RAG pipeline ready!")
    return qa_chain

