system("clear") || system("cls")

 

x = '==========================================================================================================================================='
y = x 
puts x.length

y = y.split("")
contador = 0
pula = 46 
puts x
y.each do |s|
contador += 1
pula -= 1
puts "#{s}\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t#{s}"
if contador == 6 || contador == 9 || contador == 12 || contador == 18 || contador == 24
puts "#{s}\t\t\t\t\t\t*\t\t\t\t\t\t\t\t\t\t\t\t\t#{s}"
end
if contador == 24
break
end
end
puts x





