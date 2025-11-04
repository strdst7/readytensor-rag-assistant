#!/bin/bash
# 🚀 Ready Tensor RAG Assistant Launcher — with color and status checks

# --- 🎨 COLORS ---
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color

# --- 🧭 NAVIGATE ---
cd "$(dirname "$0")"

echo -e "${BLUE}🔹 Initializing Ready Tensor RAG Assistant...${NC}"

# --- 🧠 ACTIVATE VENV ---
if [ -d "venv" ]; then
  echo -e "${YELLOW}Activating virtual environment...${NC}"
  source venv/bin/activate
else
  echo -e "${RED}❌ Virtual environment not found. Run: python3 -m venv venv && source venv/bin/activate${NC}"
  exit 1
fi

# --- 🔑 LOAD .ENV ---
if [ -f ".env" ]; then
  echo -e "${YELLOW}Loading environment variables from .env...${NC}"
  export $(grep -v '^#' .env | xargs)
else
  echo -e "${RED}❌ .env file not found. Please create it with your OpenAI API key.${NC}"
  exit 1
fi

if [ -z "$OPENAI_API_KEY" ]; then
  echo -e "${RED}❌ OPENAI_API_KEY not set! Check your .env file.${NC}"
  exit 1
fi

# --- 🧹 CLEAN OLD UVICORN ---
echo -e "${YELLOW}Stopping any existing FastAPI processes on port 8000...${NC}"
kill -9 $(lsof -ti:8000) 2>/dev/null
sleep 1

# --- ⚙️ START FASTAPI ---
echo -e "${BLUE}🧠 Starting FastAPI backend on port 8000...${NC}"
nohup python3 -m uvicorn src.api_server:app --host 0.0.0.0 --port 8000 --reload > backend.log 2>&1 &
sleep 3

# Check if FastAPI started
if lsof -i :8000 > /dev/null; then
  echo -e "${GREEN}✅ FastAPI is running at http://localhost:8000${NC}"
else
  echo -e "${RED}❌ FastAPI failed to start. Check backend.log for errors.${NC}"
  exit 1
fi

# --- 💬 START STREAMLIT ---
echo -e "${BLUE}💬 Launching Streamlit UI...${NC}"
streamlit run src/app_ui.py

# --- 🧾 CLEAN EXIT ---
echo -e "${GREEN}✅ Ready Tensor Assistant running successfully!${NC}"
#!/bin/bash

# 🚀 Ready Tensor RAG Assistant Launcher

# Navigate to project root
cd "$(dirname "$0")"

# Activate virtual environment
echo "🔹 Activating virtual environment..."
source venv/bin/activate

# Check for OPENAI_API_KEY
if [ -z "$OPENAI_API_KEY" ]; then
  echo "⚠️ OPENAI_API_KEY not set. Loading from .env file..."
  export $(grep -v '^#' .env | xargs)
fi

# Kill any old uvicorn process
echo "🧹 Cleaning up old servers on port 8000..."
kill -9 $(lsof -ti:8000) 2>/dev/null

# Start FastAPI backend in background
echo "🧠 Starting FastAPI backend..."
nohup python3 -m uvicorn src.api_server:app --host 0.0.0.0 --port 8000 --reload > backend.log 2>&1 &

# Give it a moment to start
sleep 3

# Start Streamlit UI
echo "💬 Launching Streamlit UI..."
streamlit run src/app_ui.py

