require './lib/cook_book'
require './lib/ingredient'
require './lib/recipe'
require 'minitest/autorun'

class CookBookTest < Minitest::Test

  def setup
    @cookbook = CookBook.new
  end

  def test_creation_date
    assert_equal "06-03-2020", @cookbook.date
  end
end
