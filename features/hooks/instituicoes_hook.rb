Before '@emprestimos' do

    @banco = Faker::Bank.name
    @estado = Faker::Address.state
   

    @body = {
        "banco": @banco,
        "estadoAtuacao": @estado,
    }

    @semprestimos = Startup.new(@body)
    
end