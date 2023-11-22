import pyodbc

def conectar_banco():
    try:
        # Substitua as informações de conexão com os valores do seu ambiente
        conn = pyodbc.connect('DRIVER={SQL Server};SERVER=seu_servidor;DATABASE=seu_banco;UID=seu_usuario;PWD=sua_senha')
        print("Conexão bem-sucedida ao banco de dados.")
        return conn
    except pyodbc.Error as e:
        print(f"Erro ao conectar ao banco de dados: {e}")
        return None
