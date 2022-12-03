class Student < ApplicationRecord
	has_many :assigned_books
	has_many :returned_books
end
