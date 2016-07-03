require( 'minitest/autorun' )
require_relative( '../models/album' )

class TestBooking < MiniTest::Test

  def setup
    options = {
      'title' => 'Surfa Rosa',
      'format' => 'LP',
      'cat_number' => 'CAD803',
      'distributor' => 'PIAS'
    }

    @album = Album.new( options )
  end

  def test_title()
    assert_equal( 'Surfa Rosa', @album.title() )
  end

  def test_format()
    assert_equal( 'LP', @album.format() )
  end

  def test_catalogue_number()
    assert_equal( 'CAD803', @album.cat_number() )
  end

  def test_distributor()
    assert_equal( 'PIAS', @album.distributor() )
  end
  
  
  

end    
