require 'date'
require 'i18n'

def calcData(stringData)
end

def  bem_vindo()
    puts "Lista de Ações com Cálculo do DARF 15%"
    puts "Licença Apache 2.0"
   #puts "Ajude o desenvolvedor"
   # puts "Mande ethereum para o seguinte endereço, com mensagem de solicitaçao"
   # puts "0x2b29C94371E0155f8B0785C98eD1718746366a2b"
   # puts "Obrigado"
end

def inserir_acao()
    puts "Digite a sigla da ação :"
    nome = gets.chomp()
    puts "Digite o valor de compra da ação:"
    preco  = gets.to_f()
    puts "Digite a quantidade de ações comprada:"
    quantidade = gets.to_i()
    puts "Digite a data de compra no formato: dia(xx)/mes(xx)/ano(xxxx)"
    dataCompra =gets.chomp()
    dataCompra = Date.strptime(dataCompra,'%d/%m/%Y')
    puts "Digite o custo da compra - Emolumentos + corretora"
    custoCompra = gets.to_f()
    return { sigla: nome, valor: preco, quantidade: quantidade, dia: dataCompra, custos:custoCompra}
end

def lista_acao(acoes)
    puts "Lista de ações cadastradas" 
    puts " "
    acoes.each do |acao|
        puts "\t#{"DATA".ljust(10) } \t#{"SIGLA".ljust(10) } \t#{"QUANTIDADE".ljust(10) } \t#{"VALOR".ljust(10) } \t#{"TOTAL".ljust(10) } \t#{"CUSTOS".ljust(10) }"
        puts " "
        puts "* \t#{ acao[:dia].to_s.ljust(10) } \t #{ acao[:sigla].to_s.ljust(10) } \t#{ acao[:quantidade].to_s.ljust(10) } \tR$ #{ acao[:valor].to_s.ljust(10) } \tR$ #{ acao[:quantidade].to_f * acao[:valor].to_f } \tR$ #{ acao[:custos] }"
        puts " "
    end
end

def  menu()
    puts "================================================="
    puts "[ 1 ] Cadastrar nova Ação"
    puts "[ 2 ] Ver as Ações cadastradas"
    puts "[ 3 ] Sair"
    puts "================================================="
    print 'Digite a Opção  =>  '
    return gets.to_i
end

acoes  =  [ ]
aux = '1'
opcao = 0
#mensagem de boas vindas
bem_vindo()
while ( opcao != 3 )do
    opcao = menu() 
    if ( opcao == 1 )
        acoes << inserir_acao()       
        puts "Ação digitada foi #{acoes[-1][:sigla]}"
    elsif ( opcao == 2)
        lista_acao(acoes)
        end
end

puts "Programa encerrado"