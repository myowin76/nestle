require 'test_helper'

class GtinTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Gtin.new.valid?
  end
end
