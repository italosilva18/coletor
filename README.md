# Coleta de Dados - Projeto XYZ

## Descrição
Este projeto tem como objetivo realizar a coleta, processamento e envio de dados de um banco de dados local para uma API remota.

## Estrutura do Projeto

- `consultas/`: Pasta contendo consultas SQL para serem executadas no banco de dados.
- `scripts/`: Pasta com scripts Python para conexão e processamento de dados.
   - `conexao_banco.py`: Script para estabelecer conexão com o banco de dados.
   - `processamento_dados.py`: Script para processar os dados obtidos e enviar para a API.
- `README.md`: Este arquivo, contendo informações sobre o projeto.

## Como Usar

1. Certifique-se de ter o Python instalado.
2. Configurar o ambiente Python.
    ```bash
    pip install -r requirements.txt
    ```
3. Preencha as informações de conexão no arquivo `conexao_banco.py`.
4. Adicione consultas SQL no arquivo `consultas.json`.
5. Execute o script `processamento_dados.py` para coletar e enviar os dados.

## Observações
- As consultas no arquivo `consultas.json` devem ser válidas para o banco de dados em uso.
- Ajuste as configurações de conexão e a lógica de processamento conforme necessário.
