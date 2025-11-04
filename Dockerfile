# Base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy files
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 8000

# Set environment variable for OpenAI API key
ENV OPENAI_API_KEY=${OPENAI_API_KEY}

# Run the FastAPI app
CMD ["uvicorn", "src.api_server:app", "--host", "0.0.0.0", "--port", "8000"]
