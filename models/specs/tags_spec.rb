require('minitest/autorun')
require('minitest/rg')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../tag.rb")

class TestTag < MiniTest::Test

  def setup
    details = {'id' => 1, 'type' => 'Travel'}
    @tag = Tag.new(details)
  end

  def test_new
    result = @tag.type()
    assert_equal('Travel', result)
  end
  
end
