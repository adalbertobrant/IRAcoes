class Cpf
  attr_reader :cpf

  def initialize(cpf)
    @cpf = cpf
  end

  def verifica_cpf
    return false unless cpf.is_a?(String)

    return false unless cpf.length == 11

    cpf_array_numerico_com_indice = cpf
                                    .chars
                                    .map(&:to_i)
                                    .each_with_index
    primeira_soma = cpf_array_numerico_com_indice
                    .map { |numero, indice| numero * (indice + 1) }
                    .inject(:+)
    segunda_soma = cpf_array_numerico_com_indice
                  .map { |numero, indice| numero * indice }
                  .inject(:+)

    primeiro_verificador, segundo_verificador = [primeira_soma, segunda_soma]
                                                .map(&verificador_soma)
    
    return true if(primeiro_verificador === cpf[9] && segundo_verificador == cpf[10])
    false
  end


  verificador_soma = -> (soma) do
    raise TypeError unless soma.is_a?(Number)

    resto_divisao = soma % 11
    resto_divisao == 10 ? 0 : resto_divisao
  end
end