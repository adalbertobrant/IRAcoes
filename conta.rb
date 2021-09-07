require 'nokogiri'
require 'restclient'
require 'json'

require_relative "stocks"

class Conta 
  attr_reader :titular,:cpf
  attr_accessor :acoes

  def initialize(titular,cpf)
    @titular = titular
    @cpf = cpf
    @acoes = Array.new([])
  end

  def cadastrarAcao(params)
    self.acoes << params  
  end

  def closePriceGatherDataGoogleFinance()
    arraySiglas = self.acoes.map{ |x| x.nome }
    valores = arraySiglas.map{ |nome| 
      puts nome
      url = "https://www.google.com/finance/quote/#{nome}:BVMF"
      response = Nokogiri::HTML(RestClient.get(url))
      fechamento = response.css('.kf1m0').css('.kf1m0').first.text
      fechamento.slice!("R$")
      valor = fechamento.to_f  
      valor
    }
    precoFechamento = Hash[arraySiglas.zip valores]    

  end


end