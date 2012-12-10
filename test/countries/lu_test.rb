require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Luxembourg
class LUTest < Phoner::TestCase

  def test_local
    parse_test('+352 79 12 34', '352', '79', '1234', "Luxembourg", false)
    parse_test('+352 2679 12 34', '352', '2679', '1234', "Luxembourg", false)
    parse_test('+352 4 123 45', '352', '4', '12345', "Luxembourg", false)
  end

  def test_mobile
    parse_test('+352 6 12345678', '352', '6', '12345678', "Luxembourg", true)
  end

end
