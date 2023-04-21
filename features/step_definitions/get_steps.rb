Dado('O endereço da API para apresentação de empréstimos bancários') do
    $uri_base = "https://8dac9f4e-fcb2-4e8f-857a-e4ed3497a0d8.mock.pstmn.io/bank"
    end
  
Quando('realizar uma requisição para consultar as instituições') do
    @response = HTTParty.get($uri_base, :header => {'content-type': 'application/json', 'Authorization': 'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJkZXNhZmlvIjoic2VyYXNhIn0.oOMv4kf9hKMtuatZEZJyESVu9Z7h6hGBwrZRJ-9HkCU'})
    end
  
Então('a API irá retornar os dados das instituições cadastradas respondendo o código 200') do
    expect(@response.code).to eq(200)
    puts "response code #{@response.code}"
    puts "response body #{@response.body}"
    end

Quando('realizar uma requsição para consultar as instituições utilizando os parameters\(estadoAtuacao=SP)') do
    @response = HTTParty.get($uri_base, :header => {'content-type': 'application/json', 'Authorization': 'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJkZXNhZmlvIjoic2VyYXNhIn0.oOMv4kf9hKMtuatZEZJyESVu9Z7h6hGBwrZRJ-9HkCU'}, :query => {'estadoAtuacao' => 'SP'})
    end
      
Então('a API iráretornar a lista de todos os bancos cadastrados no estado de atuação informado respondendo o código {int}') do |int|
    # Então('a API iráretornar a lista de todos os bancos cadastrados no estado de atuação informado respondendo o código {float}') do |float|
    expect(@response.code).to eq(200)
    puts "response code #{@response.code}"
    puts "response body #{@response.body}"
    end

Quando('realizar uma requsição para consultar as instituições utilizando os parameters\(banco=Nubank)') do
    @response = HTTParty.get($uri_base, :header => {'content-type': 'application/json', 'Authorization': 'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJkZXNhZmlvIjoic2VyYXNhIn0.oOMv4kf9hKMtuatZEZJyESVu9Z7h6hGBwrZRJ-9HkCU'}, :query => {'banco' => 'Nubank'})
      end
      
Então('a API irá retornar a lista de todos os bancos cadastrados com o nome do banco informado.') do
    expect(@response.code).to eq(200)
    puts "response code #{@response.code}"
    puts "response body #{@response.body}"
      end
      
Quando('realizar uma requsição para consultar as instituições utilizando os parameters\(id={int})') do |int|
      # Quando('realizar uma requsição para consultar as instituições utilizando os parameters\(id={float})') do |float|
      @response = HTTParty.get($uri_base, :header => {'content-type': 'application/json', 'Authorization': 'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJkZXNhZmlvIjoic2VyYXNhIn0.oOMv4kf9hKMtuatZEZJyESVu9Z7h6hGBwrZRJ-9HkCU'}, :query => {'id' => '5'})
      end
      
Então('a API irá retornar o banco cadastrado com o id informado.') do
    expect(@response.code).to eq(200)
    puts "response code #{@response.code}"
    puts "response body #{@response.body}"
      end
      
Quando('realizar uma requsição para consultar as instituições utilizando os parameters\(juros={float}%)') do |float|
    @response = HTTParty.get($uri_base, :header => {'content-type': 'application/json', 'Authorization': 'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyLCJkZXNhZmlvIjoic2VyYXNhIn0.oOMv4kf9hKMtuatZEZJyESVu9Z7h6hGBwrZRJ-9HkCU'}, :query => {'juros' => "10.75%"})
      end
      
Então('a API irá retornar a lista de todos os bancos cadastrados com o valor do juros informado.') do
    expect(@response.code).to eq(200)
    puts "response code #{@response.code}"
    puts "response body #{@response.body}"
      end