Dado('o endereço da API para manter o cadastro das instituições') do
    $uri_base = "https://8dac9f4e-fcb2-4e8f-857a-e4ed3497a0d8.mock.pstmn.io/bank"
    end
  
Quando('realizar uma requisição para alterar uma instituição passado o id') do
    @updated_bank = {
        "banco":"Banco Digio",
        "estadoAtuacao":"MG",
        "juros":"13,00%"
       }
       @request = HTTParty.put($uri_base, 
       :header => {'content-type': 'application/json', 
       'Authorization': 'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJkZXNhZmlvIjoic2VyYXNhIn0.oOMv4kf9hKMtuatZEZJyESVu9Z7h6hGBwrZRJ-9HkCU'},
       :body => @new_bank)
    end
  
Então('a API irá retornar os dados da instituição alterada respondendo o código {int}') do |int|
  # Então('a API irá retornar os dados da instituição alterada respondendo o código {float}') do |float|
  expect(@request.code).to eq(200)
  expect(@request["name"]).to eq(@updated_bank[:name])
  expect(@request["job"]).to eq(@updated_bank[:job])
  end
  
Quando('realizar uma requisição para alterar uma instituição') do
    @response = HTTParty.put($uri_base, :header => {'content-type': 'application/json'}, :body => {"banco":"Banco Digio","estadoAtuacao":"MG","juros":"13,00%"})
  end
  
Então('a API irá retornar respodendo o código {int}') do |int|
  # Então('a API irá retornar respodendo o código {float}') do |float|
  expect(@response.code).to eq(401)
  puts "response code #{@response.code}"
  puts "response body #{@response.body}"
  end