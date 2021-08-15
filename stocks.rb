require 'date'
class Stocks
  attr_accessor :nome, :dataCompra, :preco, :quantidade, :custoCompra, :totalComprado

  def initialize()
    @nome = nome
    @dataCompra = dataCompra
    @preco = preco
    @quantidade = quantidade
    @custoCompra = custoCompra
    @totalComprado = totalComprado
  end

  def inserir_acao()
    puts "Digite a sigla da ação :"
    self.nome = gets.chomp()
    puts "Digite a data de compra no formato: dia(xx)/mes(xx)/ano(xxxx)"
    self.dataCompra =gets.chomp()
    self.dataCompra = Date.strptime(self.dataCompra,'%d/%m/%Y')
    puts "Digite o valor de compra da ação:"
    self.preco  = gets.to_f()
    puts "Digite a quantidade de ações comprada:"
    self.quantidade = gets.to_i()    
    puts "Digite o custo da compra - Emolumentos + corretora"
    self.custoCompra = gets.to_f()
    self.totalComprado = self.preco * self.quantidade
    puts "Dados digitados foram "
    puts " "
    puts "Data de Compra #{self.dataCompra} Sigla #{self.nome} Quantidade #{self.quantidade} Preço #{self.preco} Custo #{self.custoCompra}"
    puts " "
    puts "Verifique as informações. Se estiverem corretas aperte S para sim e N para não =>  "
    sim = gets.chomp()
    if sim === 's' || sim == 'S'
        puts "Salvando os dados"
    else  
        puts "Insira os dados corretos"
        inserir_acao
    end
    return { dia: self.dataCompra, sigla: self.nome, quantidade: self.quantidade, valor: self.preco, total: self.totalComprado, custos:self.custoCompra}
  end
end