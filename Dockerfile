# Use official Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install dependencies
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Expose Streamlit port
EXPOSE 8501

# Environment variable for Streamlit
ENV PYTHONUNBUFFERED=1

# Run both backend and frontend
CMD bash run_all.sh

docker build -t rag-assistant .
docker run -p 8501:8501 rag-assistant
http://localhost:8501
