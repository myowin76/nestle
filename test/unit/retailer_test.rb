require 'test_helper'

class RetailerTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Retailer.new.valid?
  end
end
