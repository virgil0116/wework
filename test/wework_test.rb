require 'test_helper'

class WeworkTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Wework::VERSION
  end
end
