require 'date'
require 'csv'
require 'i18n'

# declaração de constantes para usar no menu

CADASTRAR_ACAO = 1
VER_ACOES = 2
BUSCAR_ACAO = 3
GRAVAR_CSV = 4
SAIR = 5

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
    puts "Digite a data de compra no formato: dia(xx)/mes(xx)/ano(xxxx)"
    dataCompra =gets.chomp()
    dataCompra = Date.strptime(dataCompra,'%d/%m/%Y')
    puts "Digite o valor de compra da ação:"
    preco  = gets.to_f()
    puts "Digite a quantidade de ações comprada:"
    quantidade = gets.to_i()    
    puts "Digite o custo da compra - Emolumentos + corretora"
    custoCompra = gets.to_f()
    totalComprado = preco * quantidade
    apaga_tela()
    return { dia: dataCompra, sigla: nome, quantidade: quantidade, valor: preco, total: totalComprado, custos:custoCompra}
end

def lista_acao(acoes)
    puts "Lista de ações cadastradas" 
    puts " "
    acoes.each do |acao|
        puts "\t#{"DATA".ljust(10) } \t#{"SIGLA".ljust(10) } \t#{"QUANTIDADE".ljust(10) } \t#{"VALOR".ljust(10) } \t#{"TOTAL".ljust(10) } \t#{"CUSTOS".ljust(10) }"
        puts " "
        puts "* \t#{ acao[:dia].to_s.ljust(10) } \t #{ acao[:sigla].to_s.ljust(10) } \t#{ acao[:quantidade].to_s.ljust(10) } \tR$ #{ acao[:valor].to_s.ljust(10) } \tR$ #{ acao[:total] } \tR$ #{ acao[:custos] }"
        puts " "
    end
end

def gravar_csv(acoes)
    coluna = acoes.first.keys
    arquivo = CSV.generate do |csv|
        csv << coluna
        acoes.each do |acao|
            csv << acao.values
        end
    end
    File.write('csv-gerado.csv',arquivo)
    puts "Arquivo gerado com sucesso "
    puts "Nome do arquivo é csv-gerado.csv e esta no diretório do programa"
end

def buscar_acao(acoes,nome_acao)
    if acoes.empty?
        apaga_tela()
        return puts "Erro - Necessário Cadastrar as Ações Primeiro."
    end
    preco_medio = 0
    quantidade_acoes = 0
    acoes.each do |acao|  
        if acao[:sigla] == nome_acao
            puts "* \t#{ acao[:dia].to_s.ljust(10) } \t #{ acao[:sigla].to_s.ljust(10) } \t#{ acao[:quantidade].to_s.ljust(10) } \tR$ #{ acao[:valor].to_s.ljust(10) } \tR$ #{ acao[:quantidade].to_f * acao[:valor].to_f } \tR$ #{ acao[:custos] }"
            quantidade_acoes = acao[:quantidade] + quantidade_acoes
            preco_medio = preco_medio + acao[:total]
        end
    end
    puts "* \t Preço Médio para #{nome_acao} => R$ #{preco_medio / quantidade_acoes}"
end

def apaga_tela()
    system("clear") || system("cls")
end



def  menu()
    puts "================================================="
    puts "[ #{CADASTRAR_ACAO} ] Cadastrar nova Ação"
    puts "[ #{VER_ACOES} ] Ver Todas as Ações cadastradas"
    puts "[ #{BUSCAR_ACAO} ] Buscar Ação"
    puts "[ #{GRAVAR_CSV} ] Gravar o arquivo CSV"
    puts "[ #{SAIR} ] Sair"
    puts "================================================="
    print 'Digite a Opção  =>  '
    return gets.to_i
end

acoes  =  [ ]
aux = '1'
opcao = 0
#mensagem de boas vindas
bem_vindo()
while ( opcao != SAIR )do
    opcao = menu() 
    if ( opcao == CADASTRAR_ACAO )
        acoes << inserir_acao()       
        puts "Ação digitada foi #{acoes[-1][:sigla]}"
    elsif ( opcao == VER_ACOES)
        lista_acao(acoes)
    elsif ( opcao == BUSCAR_ACAO)
        puts "Entre a sigla da ação a ser buscada"
        sigla = gets.chomp()
        buscar_acao(acoes,sigla)
    elsif ( opcao == GRAVAR_CSV)
        gravar_csv(acoes)
    end
end

puts "Programa encerrado"