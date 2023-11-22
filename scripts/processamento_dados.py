import json
import pyodbc
import requests

# Função para ler consultas do arquivo JSON
def ler_consultas():
    with open('consultas/consultas.json', 'r') as file:
        consultas = json.load(file)
    return consultas

# Função para executar as consultas e processar os dados
def processar_dados(conn, consultas):
    if conn:
        cursor = conn.cursor()
        for nome_consulta, sql_query in consultas.items():
            cursor.execute(sql_query)
            dados = cursor.fetchall()

            # Processamento dos dados - Aqui você pode realizar manipulações específicas
            dados_processados = processar_dados_especificos(dados)

            # Envio dos dados processados para a API
            enviar_para_api(dados_processados, nome_consulta)

# Função fictícia de processamento específico dos dados
def processar_dados_especificos(dados):
    # Aqui você pode realizar manipulações específicas nos dados obtidos
    # Por exemplo, conversões de formato, cálculos, etc.
    return dados

# Função para enviar dados para a API remota
def enviar_para_api(dados, nome_consulta):
    endpoint_api = 'http://seu_servidor/api/receber_dados'
    headers = {'Content-Type': 'application/json'}
    data = json.dumps({"nome_consulta": nome_consulta, "dados": dados})

    response = requests.post(endpoint_api, headers=headers, data=data)

    if response.status_code == 200:
        print(f"Dados da consulta '{nome_consulta}' enviados com sucesso!")
    else:
        print(f"Falha ao enviar dados da consulta '{nome_consulta}' para a API.")

# Exemplo de uso
if __name__ == "__main__":
    conn = pyodbc.connect('DRIVER={SQL Server};SERVER=seu_servidor;DATABASE=seu_banco;UID=seu_usuario;PWD=sua_senha')
    consultas = ler_consultas()
    processar_dados(conn, consultas)
