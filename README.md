![Python](https://img.shields.io/badge/Python-3776AB?logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?logo=pandas&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-005C84?logo=mysql&logoColor=white)
![SQLAlchemy](https://img.shields.io/badge/SQLAlchemy-D71F00?logo=redhat&logoColor=white)
![Jupyter](https://img.shields.io/badge/Jupyter-F37821?logo=jupyter&logoColor=white)
![ETL Pipeline](https://img.shields.io/badge/ETL-Pipeline-blue)

## ETL API Livros

Pipeline de ETL desenvolvido em Python para coletar dados da Open Library API, tratá-los com Pandas e carregar tudo em um banco de dados MySQL com tabelas normalizadas, procedures, functions e views.

### 🔍 Etapas do Projeto
1. Extração (API Open Library)
- Endpoint: https://openlibrary.org/search.json  
- Consultas por: Harry Potter, Lord of the Rings e Jane Austen  
- Campos coletados: título, ano de publicação, autor e assunto  
- Limite de 1.000 registros  

2. Transformação (Python)
- Limpeza de texto (lowercase, remoção de acentos)  
- Normalização de colunas com listas  
- Criação de DataFrames auxiliares (ex.: autores únicos)  

3. Carga (MySQL)
- Criação de tabelas normalizadas  
- Inserts via Python (SQLAlchemy + pymysql)  
- Criação de procedures, functions, views e consultas de exemplo  

### ▶️ Como Executar
- git clone https://github.com/bavsvalle/etl-api-livros.git  
- cd etl-api-livros  
- python -m venv venv  
- source venv/bin/activate  # ou venv\Scripts\activate no Windows  
- pip install -r requirements.txt  
- Configure o .env com suas credenciais MySQL e rode o notebook.

### 🛠️ Tecnologias
Python · Pandas · Requests · SQLAlchemy · PyMySQL · MySQL · Jupyter Notebook

### 📂 Estrutura do Repositório
    etl-api-livros/  
    ├── notebooks/  
    │   └── api_livros.ipynb  
    └── sql/  
        ├── 01_create_tables.sql  
        ├── 02_insert.sql  
        ├── 03_function.sql  
        ├── 04_procedure.sql  
        ├── 05_views.sql  
        └── 06_consultas.sql  
          
