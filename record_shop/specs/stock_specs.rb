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
    assert_equal( '5', @stock.quantity() )
  end
  
  

end    

