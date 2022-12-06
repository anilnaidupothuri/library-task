class Student < ApplicationRecord
	has_many :assigned_books
	has_one_attached :image
	belongs_to :user
end
