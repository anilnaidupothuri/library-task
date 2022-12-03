# frozen_string_literal: true

require 'test_helper'

class AssignedBookTest < ActiveSupport::TestCase
  setup do
    @assigned_book = assigned_books(:one)
  end

  test 'should have Student id' do
    assert_not_nil @assigned_book.student.id
  end

  test 'should have Book name' do
    assert_not_nil @assigned_book.book_id
  end

  test 'should invalid with taken book id' do
    book = books(:one)
    new_book = AssignedBook.new(student_id: 1, book_id: book.id)
    assert_not new_book.valid?
  end
end
