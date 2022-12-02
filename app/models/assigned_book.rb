class AssignedBook < ApplicationRecord
 # validates :Book_Name,  presence:true
  belongs_to :student
  belongs_to :book
end
