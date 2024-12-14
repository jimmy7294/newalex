<div align="center">

# ÅlexGPT Introduction

Welcome to ÅlexGPT. This project is designed to make legal information more accessible on Åland, by providing context-aware answers to questions specific to Åland's laws and regulations. Built with both end users and developers in mind.

<img src="preview_1.png" alt="Preview of the application" width="400">
<img src="preview_2.png" alt="Another preview of the application" width="400" height="230">


[![Python 3.10+](https://img.shields.io/badge/python-3.10+-blue.svg)](https://www.python.org/downloads/release/python-31013/)
[![Powered by LangChain](https://img.shields.io/badge/Powered%20by-LangChain-blue)](https://www.langchain.com/)
[![Powered by Gradio](https://img.shields.io/badge/Powered%20by-Gradio-orange)](https://github.com/gradio-app/gradio)
[![Powered by Kotaemon](https://img.shields.io/badge/Powered%20by-Kotaemon-blue)](https://github.com/cinnamon/kotaemon)
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

</div>

<!-- start-intro -->

### For end users

- **Clean & Minimalistic UI**: A user-friendly interface for RAG-based QA.
- **Support for Various LLMs**: Compatible with LLM API providers (OpenAI, AzureOpenAI, Cohere, etc.) and local LLMs (via `ollama` and `llama-cpp-python`).
- **Easy Installation**: Simple scripts to get you started quickly.

### For developers

- **Framework for RAG Pipelines**: Tools to build your own RAG-based document QA pipeline.
- **Customizable UI**: See your RAG pipeline in action with the provided UI, built with <a href='https://github.com/gradio-app/gradio'>Gradio <img src='https://img.shields.io/github/stars/gradio-app/gradio'></a>.

## Key Features

- **Host your own document QA (RAG) web-UI**: Allow users to query Åland-specific legal documents. Includes multi-user login, the ability to organize files in private/public collections, and features for collaboration and sharing.

- **Organize your LLM & Embedding models**: Supports both local and popular API providers such as OpenAI and Azure for enhanced question-answering capabilities tailored to legal information.

- **Hybrid RAG pipeline**: Combines full-text and vector-based retrieval for high-quality responses. The pipeline is optimized to handle complex legal documents effectively.

- **Multi-modal QA support**: Perform Question Answering on Åland's legal documents, including support for parsing tables, figures, and other structured content.

- **Advanced citations with document preview**: Provides detailed citations to ensure the accuracy of responses. Citations are viewable directly in an in-browser PDF viewer, with highlights for easy reference.

- **Support complex reasoning methods**: Handle multi-step legal inquiries using advanced reasoning techniques such as `ReAct` and `ReWOO`.

- **Configurable settings UI**: Adjust retrieval and response generation parameters through an intuitive settings interface, including prompt customization for legal context.

- **Extensible**: The application is built on `Gradio`, enabling easy customization and the addition of UI elements. Multiple strategies for document indexing and retrieval are supported, ensuring flexibility for future development.

## Installation

> 

### System requirements

1. [Python](https://www.python.org/downloads/) >= 3.10
- Required to run the application and its dependencies.
2. [Docker](https://docker.com/) (Optional)  
- Recommended for containerized deployment. Follow the Docker installation instructions for a simplified setup process.  
3. [Unstructured](https://docs.unstructured.io/open-source/installation/full-installation#full-installation) (Optional)- Required if you want to process files other than `.pdf`, `.html`, `.mhtml`, and `.xlsx` documents. Installation steps may vary by operating system; refer to the provided link for details.

#### With Docker (recommended)

Follow these steps to set up ÅlexGPT using Docker for an easy and isolated environment:

1. Prepare the Environment:
Ensure Docker and Docker Compose are installed on your system. If not, download them from the official [Docker](https://docker.com/) website.

2. Copy and Configure `.env` File:
Copy the provided `.env.example` file and rename the copy to `.env.local` to configure environment variables:

 Edit `.env.local` if you need to set custom values (e.g., OpenAI API keys or database settings).

3. Build and Start the Docker Containers:
Use the following command to build and launch the application:
```bash
docker compose build && docker compose up
```
3. Access the WebUI:
Once the setup is complete, access the ÅlexGPT WebUI by navigating to http://localhost:7860 in your browser.

### Notes:
- Configuration: Ensure all required environment variables (e.g., `OPENAI_API_KEY`) are correctly set in `.env.local`.

- Logs and Troubleshooting: Check the Docker logs for troubleshooting: 

```bash 
docker compose logs -f
```
- Stopping the Application / To stop the running containers: 
```bash
docker compose down
```

### Without Docker
Follow these steps to set up and run ÅlexGPT manually:

1. Set Up Python Environment
Create a fresh Python environment and install the necessary dependencies:
```bash 
# Optional: Create a virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Clone the repository
git clone https://github.com/digi-regeringen-ax/AlexGPT-2.git
cd AlexGPT-2

# Install dependencies
pip install -r requirements.txt
``` 

2. Create a `.env` File.  

Copy the `.env.example` file and rename it to `.env`. Update the file with your specific environment variables, such as API keys:

```bash 
cp .env.example .env
```
Ensure you configure the `OPENAI_API_KEY` and other required variables.

### Database Setup

3. To set up the database folder, run the following commands:

```bash
bash setup.sh
```


4. Start the web server:

   ```bash
   python app.py
   ```

- The application will open in your default web browser at http://localhost:7860.
- Default credentials are:
  Username: `admin`
  Password: `admin`

5. Configure LLMs and Embeddings:
Navigate to the `Resources` tab in the UI and `LLMs and Embeddings`, ensure your `api_key` value is set correctly from your `.env` file. If it is not set, you can set it there.directly in the web interface.
 

5. Check the `Resources` tab and `LLMs and Embeddings` and ensure that your `api_key` value is set correctly from your `.env` file. If it is not set, you can set it there.

#### Notes:
Python Version: Make sure you are using Python >= 3.10.
- Troubleshooting: If dependencies fail to install, ensure your requirements.txt file is complete. Regenerate it if needed:
```bash
pip freeze > requirements.txt
```
- Stopping the Application: To stop the server, use Ctrl+C in the terminal or close the terminal window.

### Setup GraphRAG

> [!NOTE]
> Official MS GraphRAG indexing only works with OpenAI or Ollama API.
> We recommend most users to use NanoGraphRAG implementation for straightforward integration with Kotaemon.

### Setup multimodal document parsing (OCR, table parsing, figure extraction)

These options are available:

- [Azure Document Intelligence (API)](https://azure.microsoft.com/en-us/products/ai-services/ai-document-intelligence)
- [Adobe PDF Extract (API)](https://developer.adobe.com/document-services/docs/overview/pdf-extract-api/)
- [Docling (local, open-source)](https://github.com/DS4SD/docling)
  - To use Docling, first install required dependencies: `pip install docling`

Select corresponding loaders in `Settings -> Retrieval Settings -> File loader`

### Customize your application

- By default, all application data is stored in the `./ktem_app_data` folder. You can back up or copy this folder to transfer your installation to a new machine.

- For advanced users or specific use cases, you can customize these files:

  - `flowsettings.py`
  - `.env`

#### `flowsettings.py`

This file contains the configuration of your application. You can use the example
[here](flowsettings.py) as the starting point.

<details>

<summary>Notable settings</summary>

```python
# setup your preferred document store (with full-text search capabilities)
KH_DOCSTORE=(Elasticsearch | LanceDB | SimpleFileDocumentStore)

# setup your preferred vectorstore (for vector-based search)
KH_VECTORSTORE=(ChromaDB | LanceDB | InMemory | Qdrant)

# Enable / disable multimodal QA
KH_REASONINGS_USE_MULTIMODAL=True

# Setup your new reasoning pipeline or modify existing one.
KH_REASONINGS = [
    "ktem.reasoning.simple.FullQAPipeline",
    "ktem.reasoning.simple.FullDecomposeQAPipeline",
    "ktem.reasoning.react.ReactAgentPipeline",
    "ktem.reasoning.rewoo.RewooAgentPipeline",
]
```

</details>

#### `.env`

The `.env` file allows you to configure models and credentials for ÅlexGPT. Ensure this file is located in the root directory of the project. If it doesn’t exist, create it by copying the provided `.env.example.`
<details>

<summary>Configure Models via the .env File</summary>

Supported Providers : 

  - **OpenAI**
   Set up OpenAI's lightweight GPT-4 variant for optimal performance and cost efficiency by adding the following to your `.env` file: 

    ```bash
    OPENAI_API_BASE=https://api.openai.com/v1
    OPENAI_API_KEY=<your OpenAI API key here>
    OPENAI_CHAT_MODEL=gpt-4o-mini
    OPENAI_EMBEDDINGS_MODEL=text-embedding-ada-002
    ```
  - **Azure OpenAI**

    For Azure OpenAI models, provide your Azure endpoint and API key:

    ```bash
   AZURE_OPENAI_ENDPOINT=https://<your-endpoint>.azure.com/
   AZURE_OPENAI_API_KEY=<your Azure API key here>
   OPENAI_API_VERSION=2024-02-15-preview
   AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4
   AZURE_OPENAI_EMBEDDINGS_DEPLOYMENT=text-embedding-ada-002
    ```

  - **Local Models**
    - Using `ollama` OpenAI compatible server:

      - Install [ollama](https://github.com/ollama/ollama) and start the application.

      - Pull your model, for example:

        ```shell
        ollama pull llama3.1:8b
        ollama pull nomic-embed-text
        ```
     Configure the models via the .env file or set them directly in the web UI.

    - Using `GGUF` with `llama-cpp-python`: Download compatible models from the [Hugging Face Hub](https://huggingface.co/models). Add the model path to your `.env`:
 
    ```bash 
    GGUF_MODEL_PATH=/path/to/your/model.gguf
    ```
  </details>

### Adding your own RAG pipeline

#### Custom Reasoning Pipeline

1. Check the default pipeline implementation in `libs/ktem/ktem/reasoning/simple.py`.
2. Add a new Python file under `libs/ktem/ktem/reasoning/` to implement your custom logic.
3. Update `flowsettings.py` to include your custom pipeline for use in the UI.

<!-- end-intro -->

## Citation

If you build upon ÅlexGPT, please use the following citation:
```BibTeX
@misc{alexgpt2024,
    title = {ÅlexGPT - Legislation Buddy on Åland's legal information},
    author = {The ÅlexGPT Team at Digitaliseringsenheten},
    year = {2025},
    howpublished = {\url{https://github.com/digi-regeringen-ax/AlexGPT-2}},
}
```
 
## Contribution

Created by :  
[Jimmy](https://github.com/jimmy7294) | [Jere](https://github.com/j4b5) | [Korin](https://github.com/blueskiy01)  

[Contributing Guide](https://github.com/digi-regeringen-ax/AlexGPT-2/blob/main/CONTRIBUTING.md)
We welcome contributions to ÅlexGPT to help improve and expand its capabilities. Your input is invaluable to the success of this project. 