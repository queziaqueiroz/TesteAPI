#language: pt

Funcionalidade: No sistema de apresentação de empréstimos bancários
faz-se necessário a apresentação dos juros por instituições
financeiras e estados de atuação de cada uma.
Aqui vamos testar a funcionalidade de alterção de dados das instituições

Cenário: Alterar dados de uma instituição com id
    Dado o endereço da API para manter o cadastro das instituições
    Quando realizar uma requisição para alterar uma instituição passado o id
    Então a API irá retornar os dados da instituição alterada respondendo o código 200 

Cenário: Alterar dados de uma instituição sem Authorization
    Dado o endereço da API para manter o cadastro das instituições
    Quando realizar uma requisição para alterar uma instituição
    Então a API irá retornar respodendo o código 401
