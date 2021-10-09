require 'minitest/autorun'
require_relative '../lib/cpf'
class CpfTest < Minitest::Test
  def test_if_cpf_is_not_a_number
    number_cpf = rand(11111111111..99999999999)
    refute verifica_cpf(number_cpf)
  end
end