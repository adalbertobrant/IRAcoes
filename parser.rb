require 'open-uri'
require 'nokogiri'
require 'restclient'
require 'json'


puts "Teste de captura de resultados web"
puts "  "
puts "Entre o nome a ser procurado no google => "
nome = gets.chomp()

url = "https://www.google.com/finance/quote/#{nome}:BVMF"
puts "=============================================="
puts "  "
puts "Fazendo a busca => #{url}"
puts "  " 





response = Nokogiri::HTML(RestClient.get(url))
fechamento = response.css('.uptEI').css('.M2CUtd').first.text
#fechamento = response.css('.uptEI').css('.M2CUtd')[0]
fechamento.slice!("R$")
fechamento = fechamento.to_f
puts fechamento




