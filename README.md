# ETL API Livros

Este projeto tem como objetivo coletar, tratar e armazenar dados de livros a partir da API pública da Open Library, utilizando técnicas de ETL (Extract, Transform, Load) com Python e integração direta com MySQL.

## 📊 Etapas do Projeto

  1. **Coleta dos Dados**
      - Fonte: [Open Library API](https://openlibrary.org/search.json)
      - Parâmetros de busca: `title:harry potter OR title:lords of the rings OR author:jane austen`
      - Campos extraídos: `title, publish_year, author_key, author_name, subject`
      - Limite de registros: 1.000
      - Requisições realizadas com `requests` e tratamento com `pandas`

  2. **Tratamento (ETL) com Python**
      - Remoção de acentos com `Unidecode`
      - Padronização de textos em minúsculas
      - Conversão de colunas com listas (ex: `author_name`) em DataFrames de strings únicas
      - Criação de DataFrame com autores únicos, ordenados alfabeticamente
      - Manipulação e transformação de dados com `pandas`
      - Desenvolvimento realizado via VS Code

  3. **Armazenamento em Banco de Dados (MySQL)**
      - Criação de tabelas normalizadas
      - Conexão direta com MySQL via `SQLAlchemy` e `pymysql`
      - Importação dos dados tratados via código Python
      - Criação de tabelas principais e de relacionamento
      - Inclusão de Functions
      - Inclusão de Procedures
      - Inclusão de Views
      - Inclusão de exemplos de consultas internas
        
