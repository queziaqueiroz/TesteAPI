require 'httparty'

response = HTTParty.get('https://8dac9f4e-fcb2-4e8f-857a-e4ed3497a0d8.mock.pstmn.io/bank')
    puts "response code: #{response.code}"
    puts "response body: #{response.body}"