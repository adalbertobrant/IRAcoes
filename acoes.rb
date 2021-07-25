def  menu()
    puts "================================================="
    puts "[ 1 ] Cadastrar nova Ação"
    puts "[ 2 ] Ver as Ações cadastradas"
    puts "[ 3 ] Sair"
    puts "================================================="
end

acoes  =  [ ]
aux = '1'
opcao = 0
puts "Bem Vindo a Lista de Ações"

while ( opcao != 3 )do
    menu()    
    print 'Digite a Opção  =>  '
    opcao = gets.to_i()

    if ( opcao == 1 )
        puts "Digite a sigla da ação :"
        nome = gets.chomp()
        puts "Digite o valor de compra da ação:"
        preco  = gets.to_f()
        puts "Digite a quantidade de ações comprada:"
        quantidade = gets.to_i()
        puts "Digite a data de compra no formato: dia(xx)/mes(xx)/ano(xxxx)"
        dataCompra = gets.chomp()
        acoes << { sigla: nome, valor: preco, quantidade: quantidade, dia: dataCompra }
        puts "Ação digitada foi #{acoes[-1][:sigla]}"
    elsif ( opcao == 2)
        puts "Lista de ações cadastradas"
        acoes.each do |acao|
            puts "\t DATA  \t\tSIGLA  \tQUANTIDADE  \tVALOR UNITÁRIO \t TOTAL "
            puts "\t#{ acao[:dia] } -\t #{ acao[:sigla] } -\t #{ acao[:quantidade] } - \tR$ #{ acao[:valor] } - \tR$ #{ acao[:quantidade] * acao[:valor] }"
            puts "========================================================="
        end
    end
end

puts "Programa encerrado"
