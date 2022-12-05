require 'test_helper'

class AssignedBooksControllerTest < ActionDispatch::IntegrationTest
  setup do 
    @assigned_book = assigned_books(:one)
    @book = books(:one)
    @student = students(:one)
  end

  test 'should show assigned books' do 
    get assigned_book_url(@assigned_book), as: :json 
    assert_response :success 

    json_response = JSON.parse(response.body)
    
    assert_equal @assigned_book.Book_Name, json_response['Book_Name']    
  end

  test 'should show all assigned_books' do 
    get assigned_books_url, as: :json 
    assert_response :success
  end

  test 'should create assigned books' do 
    assert_difference('AssignedBook.count') do 
      post assigned_books_url, params:{ assigned_book: {book_id: @book.id, student_id:@student.id} }, as: :json
       byebug                  headers: {Authorization :}          
      end 
      assert_response :success 
    end
    test 'should delete assigned books' do 
      assert_difference('AssignedBook.count', -1) do 
        delete assigned_book_url(@assigned_book)
      end 
      assert_response :no_content
    end

  
end
