require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Italy
class ITTest < Phoner::TestCase

  def test_local
    parse_test('+39 4 1234 5678', '39', '4', '12345678', "Italy", false)
  end

  def test_mobile
    parse_test('+39 3 22 123 456', '39', '3', '22123456', "Italy", true)
    #parse_test('+39 3 22 123 4567', '39', '3', '221234567', "Italy", true)
    #parse_test('+39 3 22 1234 5678', '39', '3', '2212345678', "Italy", true)
  end

end
