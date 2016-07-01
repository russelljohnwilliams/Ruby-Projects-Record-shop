require( 'minitest/autorun' )
require_relative( '../models/album' )

class TestBooking < MiniTest::Test

  def setup
    options = {
      'title' => 'Surfa Rosa',
      'format' => 'LP',
      'catalogue_number' => 'CAD803',
      'distributor' => 'PIAS'
    }

    @album = Album.new( options )
  end

  def test_title()
    assert_equal( 'Surfa Rosa', @album.title() )
  end
  
  

end    
