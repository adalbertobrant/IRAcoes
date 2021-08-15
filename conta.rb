
require_relative "stocks"

class Conta 
  attr_reader :titular,:cpf
  attr_accessor :acoes

  def initialize(titular,cpf)
    @titular = titular
    @cpf = cpf
    @acoes = Array.new([])
  end

  def cadastrarAcao(params = {})
    self.acoes << params  
  end
end