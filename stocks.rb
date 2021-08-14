class Conta 
  attr_reader :titular,:cpf
  attr_accessor :acoes

  def initialize(titular,cpf)
    @titular = titular
    @cpf = cpf
    @acoes = Array.new([])
  end

  def cadastrarAcoes(params = {})
    
    self.acoes << params
  
  end
end