#!/bin/bash
# 🚀 Ready Tensor RAG Assistant Launcher for Render (Streamlit-first)

echo "🔹 Starting Ready Tensor RAG Assistant (Render version)..."

# Load environment variables
if [ -f ".env" ]; then
  export $(grep -v '^#' .env | xargs)
else
  echo "⚠️ No .env file found. Ensure OPENAI_API_KEY is set in Render Environment Variables."
fi

# Start Streamlit UI (this is the main web app)
echo "💬 Launching Streamlit UI..."
streamlit run src/app_ui.py --server.port 10000 --server.address 0.0.0.0
