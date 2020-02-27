require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require 'pry'


class ItemTest < Minitest::Test
  def setup
    @item = Item.new(name: 'Peach', price: "$0.75")
  end

  def test_it_has_attributes
    assert_equal 'Peach', @item.name
    assert_equal 0.75, @item.price
  end
end
