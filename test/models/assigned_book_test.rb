require 'test_helper'

class AssignedBookTest < ActiveSupport::TestCase
  setup do 
    @assigned_book = assigned_books(:one)
  end

  test 'should have Student Name' do 
    
    assert_not_nil @assigned_book.Student_Name 
  end

  test 'should have Book name' do 
        assert_not_nil @assigned_book.Book_Name
  end 

end
