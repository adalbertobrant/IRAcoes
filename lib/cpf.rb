class Cpf
  attr_reader :cpf

  VERIFICADOR_SOMA = -> (soma) do
    raise TypeError unless soma.is_a?(Numeric)

    resto_divisao = soma % 11
    resto_divisao == 10 ? 0 : resto_divisao
  end

  private_constant :VERIFICADOR_SOMA

  def initialize(cpf)
    @cpf = cpf
  end

  def verifica_cpf
    return false unless cpf.is_a?(String)

    return false unless cpf.length == 11

    cpf_array = cpf.chars
    primeira_soma = cpf_array[..8]
                    .map(&:to_i)
                    .each_with_index
                    .map { |numero, indice| numero * (indice + 1) }
                    .inject(:+)

    segunda_soma = cpf_array[..9]
                    .map(&:to_i)
                    .each_with_index
                    .map { |numero, indice| numero * indice }
                    .inject(:+)

    primeiro_verificador, segundo_verificador = [primeira_soma, segunda_soma]
                                                .map(&VERIFICADOR_SOMA)
    
    if primeiro_verificador === cpf[9].to_i && segundo_verificador == cpf[10].to_i
      return true
    end

    false
  end
end