#!/bin/bash

echo "🚀 Starting Ready Tensor RAG Assistant..."

# Start FastAPI backend
uvicorn src.main:app --host 0.0.0.0 --port 8000 &

# Give backend time to start
sleep 3

# Start Streamlit frontend
streamlit run src/app_ui.py --server.port 8501 --server.address 0.0.0.0
