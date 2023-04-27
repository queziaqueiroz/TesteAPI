Dado('O endereço da API para cadastrar nova instituição') do
    $uri_base = "https://8dac9f4e-fcb2-4e8f-857a-e4ed3497a0d8.mock.pstmn.io/bank/3"
    end
Quando('realizar uma requisição para cadastrar uma instituição') do
    @new_bank = {
        "banco":"Banco Digio",
        "estadoAtuacao":"MG",
        "juros":"13,00%"
       }
    @request = HTTParty.post($uri_base, 
            :header => {'content-type': 'application/json', 
            'Authorization': 'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJkZXNhZmlvIjoic2VyYXNhIn0.oOMv4kf9hKMtuatZEZJyESVu9Z7h6hGBwrZRJ-9HkCU'},
            :body => @new_bank)
  end
  
Então('a API irá retornar os dados do cadastro da instituição respondendo o código {int}') do |int|
  # Então('a API irá retornar os dados do cadastro da instituição respondendo o código {float}') do |float|
    expect(@request.code).to eq 201
    puts "request code #{@request.code}"
    expect(@request['banco']).to eq(@new_bank[:banco])
    expect(@request['estadoAtuacao']).to eq(@new_bank[:estadoAtuacao])
    expect(@request['juros']).to eq(@new_bank[:juros])
    puts "request body #{@request.body}"
  end
  
Quando('realizar uma requisição para cadastrar uma instituição sem passar o Authorization') do
    @response = HTTParty.post($uri_base, :header => {'content-type': 'application/json'}, :body => {"banco":"Banco Pan","estadoAtuacao":"MG","juros":"13,00%"})
  end
  
Então('a API irá retornar erro respodend0 o código {int}') do |int|
  # Então('a API irá retornar respodend0 o código {float}') do |float|
  expect(@response.code).to eq(401)
  puts "response code #{@response.code}"
  puts "response body #{@response.body}"
  end
  
Quando('realizar uma requisição para cadastrar uma instituição sem passar  body') do
    @response = HTTParty.post($uri_base, 
        :header => {'content-type': 'application/json', 
        'Authorization': 'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJkZXNhZmlvIjoic2VyYXNhIn0.oOMv4kf9hKMtuatZEZJyESVu9Z7h6hGBwrZRJ-9HkCU'})
    end
  
Então('a API irá retornar erro respodendo o código {int}') do |int|
  # Então('a API irá retornar respodendo o código {float}') do |float|
  expect(@response.code).to eq(400)
  puts "response code #{@response.code}"
  puts "response body #{@response.body}"
  end
  
