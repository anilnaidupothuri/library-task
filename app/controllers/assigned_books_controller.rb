# frozen_string_literal: true

class AssignedBooksController < ApplicationController
  before_action :set_assigned_book, only: %i[show destroy update]
  before_action :check_login
  def show
    render json: @assigned
  end

  def index
    @books = AssignedBook.all
    render json: @books
  end

  def create
    @assigned = current_user.assigned_books.new(assigned_params)

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
    if AssignedBook.find_student_book(params[:student_id], params[:book_id]).empty?
      render json: 'book is not found'
    else
      a = AssignedBook.find_student_book(params[:student_id], params[:book_id]).update(assigned: false,
                                                                                       Returned_date: Date.today)

      penality = AssignedBook.find_penality(a.first)

      render json: penality
    end
  end

  private

  def assigned_params
    params.require(:assigned_book).permit(:student_id, :book_id, :assigned)
  end

  def set_assigned_book
    @assigned = AssignedBook.find(params[:id])
  end
end
