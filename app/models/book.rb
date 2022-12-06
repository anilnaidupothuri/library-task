# frozen_string_literal: true

class Book < ApplicationRecord
  has_one :assigned_books 
  belongs_to :user 
  has_one_attached :image
end
