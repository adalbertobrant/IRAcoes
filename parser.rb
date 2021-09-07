require 'nokogiri'
require 'restclient'
require 'json'


class GoogleFinanceData
  def initialize
  end

  def gatherDataGoogleFinance()
    arraySiglas = Conta.self.acoes.array.map{ |x| x.nome }
    valores = arraySiglas.map{ |nome| 
      url = "https://www.google.com/finance/quote/#{nome}:BVMF"
      response = Nokogiri::HTML(RestClient.get(url))
      fechamento = response.css('.kf1m0').css('.kf1m0').first.text
      fechamento.slice!("R$")
      valor = fechamento.to_f  
      valor
    }
    valores
  end
end


#puts "Teste de captura de resultados web"
#puts "  "
#puts "Entre o nome a ser procurado no google => "
#nome = gets.chomp()
#nome =nome.upcase 

#url = "https://www.google.com/finance/quote/#{nome}:BVMF"
#puts "=============================================="
#puts "  "
#puts "Fazendo a busca => #{url}"
#puts "  " 

#response = Nokogiri::HTML(RestClient.get(url))
#puts " "
#puts " "

#fechamento = response.css('.kf1m0').css('.kf1m0').first.text # deve ser avaliado e revisto sempre pois o google muda o algoritmo
# marcar a região do número , abaixo do nome da ação e procurar por algo como => <div jsname="ip75Cb" class="kf1m0"><div class="YMlKec fxKbKc">R$&nbsp;97,06</div></div>
# no caso a classe correta é aquela que engloba o valor ou seja dentro da primeira div jsname temos a classe kf1m0 que deve ser a escolhida
# caso não dê certo tente verificar a estrutura das classes para saber se a mesma mudou.
#fechamento.slice!("R$")
#valor = fechamento.to_f
#puts valor
#valor



