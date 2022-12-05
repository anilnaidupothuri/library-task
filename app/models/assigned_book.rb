# frozen_string_literal: true

class AssignedBook < ApplicationRecord
  # validates :student_id, uniqueness: { scope: :book_id }

  belongs_to :student
  belongs_to :book
  belongs_to :user

  def self.find_student_book(s_id, b_id)
    where(student_id: s_id, book_id: b_id)
  end

  def self.find_penality(penality)
    duration = (penality.Returned_date - penality.created_at.to_date).to_i
    penality_days = duration - 15

    if duration <= 15
      ' you dont have penality'
    elsif duration <= 30
      " your penality is : #{penality_days * 3}"
    else
      "your penality is : #{penality_days * 5}"
    end
  end
end
