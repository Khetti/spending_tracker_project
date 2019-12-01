require('minitest/autorun')
require('minitest/rg')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../merchant.rb")

class TestMerchant < MiniTest::Test

  def setup
    details = {'id' => 1, 'name' => 'Scotrail'}
    @merchant = Merchant.new(details)
  end

  def test_new
    result = @merchant.name()
    assert_equal('Scotrail', result)
  end

end
