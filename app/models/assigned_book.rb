# frozen_string_literal: true

class AssignedBook < ApplicationRecord
  # validates :Book_Name,  presence:true
  validates :book_id, uniqueness: true
  belongs_to :student
  belongs_to :book
end
