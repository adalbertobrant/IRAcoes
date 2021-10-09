require 'minitest/autorun'
require_relative '../lib/cpf'
class CpfTest < Minitest::Test
  def test_if_cpf_is_not_a_number
    number_cpf = rand(11111111111..99999999999)
    refute verifica_cpf(number_cpf)
  end

  def test_if_cpf_has_not_eleven_digits
    invalid_cpf = rand(1..9999999999).to_s
    refute verifica_cpf(invalid_cpf)
  end

  def test_if_cpf_is_a_string_and_has_eleven_digits_but_is_not_valid
    cpf = (12345678901).to_s
    refute verifica_cpf(cpf)
  end
end