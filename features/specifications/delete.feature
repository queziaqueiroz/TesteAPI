#language: pt

Funcionalidade: No sistema de apresentação de empréstimos
bancários faz-se necessário a apresentação dos juros por instituições
financeiras e estados de atuação de cada uma. 
Aqui vamos testar a funcionalidade de deletar  instituições.

Cenário: Deletar uma instituição com id
    Dado o endereço da API para manter o cadastro das instituições
    Quando realizar uma requisição para deletar uma instituição passado o id
    Então a API irá retornar os dados da instituição alterados respondendo o código 200 
