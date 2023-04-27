#language: pt

Funcionalidade: No sistema de apresentação de empréstimos bancários 
faz-se necessário a apresentação dos juros por instituições
financeiras e estados de atuação de cada uma.
Aqui vamos testar a funcionalidade de consultas das instituições

Cenário: Consultar instituições
    Dado O endereço da API para apresentação de empréstimos bancários
    Quando realizar uma requisição para consultar as instituições
    Então a API irá retornar os dados das instituições cadastradas respondendo o código 200

Cenário: Consultas de bancos por estado de atuação
    Dado O endereço da API para apresentação de empréstimos bancários
    Quando realizar uma requsição para consultar as instituições utilizando os parameters(estadoAtuacao=SP)
    Então a API iráretornar a lista de todos os bancos cadastrados no estado de atuação informado respondendo o código 200

Cenário: Consultar de bancos por nome do banco
    Dado O endereço da API para apresentação de empréstimos bancários
    Quando realizar uma requsição para consultar as instituições utilizando os parameters(banco=Nubank)
    Então a API irá retornar a lista de todos os bancos cadastrados com o nome do banco informado.


Cenário: Consultar de bancos por id do banco
    Dado O endereço da API para apresentação de empréstimos bancários
    Quando realizar uma requsição para consultar as instituições utilizando os parameters(id=5)
    Então a API irá retornar o banco cadastrado com o id informado.
    

Cenário: Consultar de bancos por valor do juros
    Dado O endereço da API para apresentação de empréstimos bancários
    Quando realizar uma requsição para consultar as instituições utilizando os parameters(juros=12.50%)
    Então a API irá retornar a lista de todos os bancos cadastrados com o valor do juros informado.
