require('minitest/autorun')
require('minitest/rg')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../transaction.rb")

class TestTransaction < MiniTest::Test

  def setup
    details = {'id' => 1, 'merchant_id' => 2, 'tag_id' => 3}
    @transaction = Transaction.new(details)
  end

  def test_new
    result = @transaction.id()
    assert_equal(1, result)
  end

end
