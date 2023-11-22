import json

consultas = {
    "TOTAL_VENDIDO_DIA": "select cast(sum(MP.Valor_Final) as float) as 'Valor' , cast(sum(MP.Total_Custo) as float) as 'Custo(CMV)' , cast(sum(MP.Valor_Final- MP.Total_Custo) as float) as 'Lucro' from Movimento_Produto MP join Movimento M on M.Ide = MP.Movimento__Ide where M.EfetivadoFinanceiro = ? and M.Desefetivado = 0 and MP.Tipo <> 'C' and M.EfetivadoFinanceiroData = ? and M.Tipo_Operacao in ('VND')",
    "TICKET_MEDIO_DIA": "select cast(avg(Total_Final) as float) as 'Ticket Médio' from Movimento where Tipo_Operacao = 'VND' and EfetivadoFinanceiro = ? and Desefetivado = 0 and EfetivadoFinanceiroData = ?",
    # ... outras consultas ...
    "MODALIDADES_PAGAMENTO_OPERADOR_DIA": "with cte as( select CONVERT(varchar,Data, 23) as data, Operador, [Cod Pagto], Descrição, sum(Qtde) as 'Qtde', sum(Valor) as 'Valor' from ( select convert(varchar, M.EfetivadoFinanceiroData, 23) as 'Data', F.Nome as 'Operador', null as 'Cod Pagto', case when MF.Tipo = 'C' then 'Cheque' when MF.Tipo = 'D' then 'Dinheiro' when MF.Tipo = 'P' then 'Parcelado' when MF.Tipo = 'T' and MF.AdministradoraCartao__Codigo = 1 then 'Credito' when MF.Tipo = 'T' and MF.AdministradoraCartao__Codigo = 2 then 'Debito' when MF.Tipo = 'R' then 'Troco' when MF.Tipo = 'L' then 'Credito Cliente' when MF.Tipo = 'I' then 'Conta Bancaria' end as 'Descrição' , 1 as 'Qtde' , MF.Valor as 'Valor' from Movimento M join Movimento_Financeiro MF on M.Ide = MF.Movimento__Ide join Funcionario F on F.Ide = M.Vendedor__Ide where M.Tipo_Operacao = 'VND' and M.EfetivadoFinanceiro = ? and M.Desefetivado = 0 and M.EfetivadoFinanceiroData between ? and ? and MF.Tipo in ('D', 'C', 'P', 'T', 'R', 'L', 'I') ) A group by Data, Operador, [Cod Pagto], Descrição ) select CONVERT(varchar,Data,23) as data, Operador, [Cod Pagto], Descrição, Qtde, case Descrição when 'Dinheiro' then Valor - ISNULL(( select CTE2.valor from cte as CTE2 where CTE2.Descrição = 'Troco' and cte.Data = CTE2.Data), 0) else Valor end as 'Total' from cte where Descrição <> 'Troco'"
}

# Escrevendo o dicionário no arquivo JSON
with open('consultas.json', 'w') as arquivo_json:
    json.dump(consultas, arquivo_json, indent=4)
