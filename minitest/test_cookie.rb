require 'minitest/autorun'
#we will require minitest. we will use autorun and it will load minitest and automatically test the file we're running without us needing to do anything

require './awesome_cookie.rb'
#above it the file/ class that we are testing

#Small test suite class which inherits from minitest:

class TestCookie < MiniTest::Test
    #the name of the test should begin with "test_"
    #To run the rest we will go to the minitest directory and the run command: ruby <filename>
    def test_something_simple
        # assert_equal(3, 1+1) #fail test
        assert_equal(2, 1+1) #pass test
    end
end
