# frozen_string_literal: true

class AssignedBooksController < ApplicationController
  before_action :set_assigned_book, only: %i[show destroy update book_recive]
  # before_action :check_login
  def show
    render json: @assigned
  end

  def index
    @books = AssignedBook.all
    render json: @books
  end

  def create
    @assigned = current_user.assigned_books.new(assigned_params)
    @assigned.assigned = true
    if @assigned.save
      render json: @assigned
    else
      render json: @assigned.errors
    end
  end

  def destroy
    @assigned.destroy
    head :no_content
  end

  def returned
    if AssignedBook.find_student_book(params).empty?
      render json: 'book is not found'
    else
      a = AssignedBook.find_student_book(params)
      if a.first.assigned

        penality = AssignedBook.find_penality(a.first)

        render json: { penality: penality, Student_Name: a.first.student.name }
      else
        render json: { student: a.first.student, no_penality: 'This student cleared his penality ' }
      end
    end
  end

  def book_recive
    return unless params[:penalty_submission] == true

    @assigned.update(assigned: false)

    render json: { penality: 'you cleared your penality', details: @assigned }
  end

  private

  def assigned_params
    params.require(:assigned_book).permit(:student_id, :book_id)
  end

  def set_assigned_book
    @assigned = AssignedBook.find(params[:id])
  end
end
