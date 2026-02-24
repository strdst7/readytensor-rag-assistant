# 🧠 Ready Tensor RAG Assistant — Dockerfile for Render (Streamlit-first)

# Base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose Streamlit port
EXPOSE 10000

# Set environment variable (Render will override this)
ENV OPENAI_API_KEY=${OPENAI_API_KEY}

# Default command: Run Streamlit app
CMD ["bash", "run_all.sh"]
