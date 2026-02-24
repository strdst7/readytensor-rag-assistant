import streamlit as st
import requests

# 🌐 Set the backend API endpoint
API_URL = "https://readytensor-rag-assistant.onrender.com/query"  # replace with your Render URL

# 🎨 Streamlit page config
st.set_page_config(
    page_title="Ready Tensor RAG Assistant",
    page_icon="🤖",
    layout="centered"
)

st.title("🤖 Ready Tensor RAG Assistant")
st.caption("Ask me anything about Ready Tensor publications!")

# 🧠 User input
query = st.text_input("Ask a question:", placeholder="e.g., What is Ready Tensor?")

# 💬 Chat history
if "chat_history" not in st.session_state:
    st.session_state.chat_history = []

# 🚀 Send query to FastAPI backend
if st.button("Submit") and query.strip():
    with st.spinner("Thinking..."):
        try:
            response = requests.post(API_URL, json={"question": query})
            if response.status_code == 200:
                answer = response.json().get("answer", "No answer received.")
            else:
                answer = f"Error: {response.status_code} — {response.text}"
        except Exception as e:
            answer = f"Request failed: {e}"

        # Add to history
        st.session_state.chat_history.append((query, answer))

# 🗂️ Display history
if st.session_state.chat_history:
    st.subheader("Conversation")
    for i, (q, a) in enumerate(reversed(st.session_state.chat_history)):
        st.markdown(f"**You:** {q}")
        st.markdown(f"**Assistant:** {a}")
        st.markdown("---")

