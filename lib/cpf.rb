def verifica_cpf(cpf)
  return false unless cpf.is_a?(String)

  return false unless cpf.length == 11

  true
end