Quando('realizar uma requisição para deletar uma instituição passado o id') do
    @request = HTTParty.delete($uri_base, 
       :header => {'content-type': 'application/json', 
       'Authorization': 'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJkZXNhZmlvIjoic2VyYXNhIn0.oOMv4kf9hKMtuatZEZJyESVu9Z7h6hGBwrZRJ-9HkCU'})
    end
  
  Então('a API irá retornar os dados da instituição alterados respondendo o código {int}') do |int|
  # Então('a API irá retornar os dados da instituição alterados respondendo o código {float}') do |float|
  expect(@request.code).to eq(200)
  puts "response code #{@request.code}"
  puts "response body #{@request.body}"
  end