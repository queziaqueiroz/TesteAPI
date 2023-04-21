#language: pt

Funcionalidade: No sistema de apresentação de empréstimos
bancários faz-se necessário a apresentação dos juros por instituições
financeiras e estados de atuação de cada uma.

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

Cenário: Cadastrar uma instituição
    Dado O endereço da API para cadastrar nova instituição
    Quando realizar uma requisição para cadastrar uma instituição
    Então a API irá retornar os dados do cadastro da instituição respondendo o código 201

Cenário: Cadastrar uma nova instituição sem Authorization
    Dado O endereço da API para cadastrar nova instituição
    Quando realizar uma requisição para cadastrar uma instituição sem passar o Authorization
    Então a API irá retornar erro respodend0 o código 401

Cenário: Cadastrar de uma nova instituição sem body
    Dado O endereço da API para cadastrar nova instituição
    Quando realizar uma requisição para cadastrar uma instituição sem passar  body
    Então a API irá retornar erro respodendo o código 400

Cenário: Alterar dados de uma instituição com id
    Dado o endereço da API para manter o cadastro das instituições
    Quando realizar uma requisição para alterar uma instituição passado o id
    Então a API irá retornar os dados da instituição alterada respondendo o código 200 

Cenário: Alterar dados de uma instituição sem Authorization
    Dado o endereço da API para manter o cadastro das instituições
    Quando realizar uma requisição para alterar uma instituição
    Então a API irá retornar respodendo o código 401

Cenário: Alterar dados de uma instituição sem body
    Dado o endereço da API para manter o cadastro das instituições
    Quando realizar uma requisição para alterar uma instituição sem passar  body
    Então a API irá retornar respodendo o código 400

Cenário: Deletar uma instituição com id
    Dado o endereço da API para manter o cadastro das instituições
    Quando realizar uma requisição para deletar uma instituição passado o id
    Então a API irá retornar os dados da instituição alterados respondendo o código 200 