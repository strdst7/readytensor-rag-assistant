
````markdown
# 🧠 Ready Tensor RAG Assistant

A **Retrieval-Augmented Generation (RAG)** AI Assistant built using **FastAPI**, **LangChain**, **ChromaDB**, and **Streamlit**.  
This assistant enables users to query Ready Tensor publications and receive intelligent, context-aware responses.

---

## 🚀 Features

- 🔗 **RAG Pipeline** – Combines document retrieval and generation for accurate contextual answers  
- ⚡ **FastAPI Backend** – Lightweight and high-performance API server  
- 🧩 **LangChain Integration** – Uses OpenAI embeddings and models for natural language understanding  
- 🗃️ **Chroma Vectorstore** – Efficient storage and semantic search for publication data  
- 💬 **Streamlit Frontend** – Simple, interactive chat-style interface  
- ☁️ **Render Deployment** – Fully Dockerized and deployable on Render or other cloud platforms  

---

## 🧰 Tech Stack

| Layer | Technology |
|--------|-------------|
| Frontend | Streamlit |
| Backend | FastAPI |
| AI Framework | LangChain |
| Database | ChromaDB |
| Embeddings | OpenAI |
| Deployment | Render (Docker) |

---

## ⚙️ Setup Instructions

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/strdst7/readytensor-rag-assistant.git
cd readytensor-rag-assistant
````

### 2️⃣ Create and Activate Virtual Environment

```bash
python3 -m venv venv
source venv/bin/activate  # macOS/Linux
pip install -r requirements.txt
```

### 3️⃣ Run Locally

```bash
bash run_all.sh
```

Then open your browser and visit:
👉 [http://localhost:8502](http://localhost:8502)

---

## 🌐 Live Demo

🔗 **Render Deployment:**
[https://readytensor-rag-assistant.onrender.com](https://readytensor-rag-assistant.onrender.com)

---

## 🖼️ Screenshots

| API Docs                                    | Streamlit App                             |
| ------------------------------------------- | ----------------------------------------- |
| ![Swagger Docs](assets/docs_screenshot.png) | ![Streamlit UI](assets/ui_screenshot.png) |

---

## 📄 License

MIT License © 2025

---

## 💡 Author

Developed by **Nur Amirah Mohd Kamil**
for *Ready Tensor RAG Assistant* submission.



