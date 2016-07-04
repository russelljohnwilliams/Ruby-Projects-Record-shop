require( 'minitest/autorun' )
require_relative( '../models/stock' )

class TestBooking < MiniTest::Test

  def setup
    options = {
      'quantity' => '5',
      'cost_price' => '2.50',
      'sale_price' => '4.99',
      'model_stock' => '3'
    }

    @stock = Stock.new( options )
  end

  def test_quantity()
    assert_equal( 5, @stock.quantity() )
  end
  
  def test_cost_price()
    assert_equal( 2.50, @stock.cost_price() )
  end
  
  def test_sale_price()
    assert_equal( 4.99, @stock.sale_price() )
  end

  def test_model_stock()
    assert_equal( 3, @stock.model_stock() )
  end
  
  def test_stock_level
    assert_equal("high", @stock.stock_level())
  end
  

end    

