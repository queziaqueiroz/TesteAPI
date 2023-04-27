#language: pt

Funcionalidade: No sistema de apresentação de empréstimos bancários 
faz-se necessário a apresentação dos juros por instituições financeiras e estados de atuação de cada uma.
Aqui vamos testar a funcionalidade de criação de novas instituições

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