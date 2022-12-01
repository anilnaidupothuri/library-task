# frozen_string_literal: true

require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
    @user = users(:one)
  end

  test 'should show book' do
    get book_url(@book), as: :json
    assert_response :success

    json_response = JSON.parse(response.body)
    assert_equal @book.name, json_response['name']
  end

  test 'should show all books' do
    get books_url, as: :json
    assert_response :success
  end

  test 'should create books when login' do
    assert_difference('Book.count') do
      post books_url, params: { book: { name: 'book1', price: 599, writter: 'naruto', pages: 127 } },
                      headers: { Authorization: JsonWebToken.encode(user_id: @user.id) }, as: :json
    end
    assert_response :created
  end

  test 'should forbid from creatig books if not login' do
    assert_no_difference('Book.count') do
      post books_url, params: { book: { name: 'test', price: 123, pages: 284, writter: 'testing' } }, as: :json
    end
    assert_response :forbidden
  end

  test 'should update books' do
    patch book_url(@book), params: { book: { writter: 'newton' } },
                           headers: { Authorization: JsonWebToken.encode(user_id: @user.id) }, as: :json

    assert_response :success
  end
 
  test 'should forbid update with out login' do 
    patch book_url(@book), params: { book: {name:"test1", writter: "newton s"}}, as: :json 
    assert_response :forbidden
  end
end
