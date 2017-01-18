require "test/unit"
require "./shopping_cart.rb"

class TestShoppingCartAmaysim < Test::Unit::TestCase

  def setup
    @init = ShoppingCart.new
  end

  def test_scenario_1
  	@init.add('ult_small')
  	@init.add('ult_small')
  	@init.add('ult_small')
  	@init.add('ult_large')
  	@init.items
  	assert_equal(94.7, @init.total) 
  end

  def test_scenario_2
  	@init.add('ult_small')
  	@init.add('ult_small')
  	@init.add('ult_large')
  	@init.add('ult_large')
  	@init.add('ult_large')
  	@init.add('ult_large')
  	@init.items
  	assert_equal(209.4, @init.total) 
  end

  def test_scenario_3
  	@init.add('ult_small')
  	@init.add('ult_medium')
  	@init.add('ult_medium')
  	@init.items
  	assert_equal(84.7, @init.total) 
  end

  def test_scenario_4
  	@init.add('ult_small')
  	@init.add('1gb','I<3AMAYSIM')
  	@init.items
  	assert_equal(31.32, @init.total) 
  end

end