require('minitest/autorun')
require('minitest/rg')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../user.rb")

class TestUser < Minitest::Test

  def setup
    details = {'id' => 1, 'budget' => 100}
    @user = User.new(details)
  end

  def test_new
    result = @user.budget()
    assert_equal(100, result)
  end

end
