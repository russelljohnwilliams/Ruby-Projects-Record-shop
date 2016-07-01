require( 'minitest/autorun' )
require_relative( '../models/artist' )

class TestBooking < MiniTest::Test

  def setup
    options = {
      'name' => 'Roxy Music', 
      'genre' => 'pop',
    }

    @artist = Artist.new( options )
  end

  def test_name()
    assert_equal( 'Roxy Music', @artist.title() )
  end
  
  def test_genre()
    assert_equal( 'pop', @artist.genre() )
  end
  

end    
