class Student < ApplicationRecord
	has_many :assigned_books
	belongs_to :user
end
