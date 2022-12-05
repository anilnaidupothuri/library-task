# frozen_string_literal: true

class AssignedBook < ApplicationRecord
  # validates :Book_Name,  presence:true
  #validates :book_id, uniqueness: true
  belongs_to :student
  belongs_to :book
  belongs_to :user

  #scope :find_student_book, ->(s_id, b_id){ where(student_id: s_id, book_id:b_id)}
  def self.find_student_book(s_id, b_id)
    AssignedBook.where(student_id:s_id, book_id:b_id)
  end
end
