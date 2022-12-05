# frozen_string_literal: true

class AssignedBooksController < ApplicationController
  before_action :set_assigned_book, only: %i[show destroy update]
  def show
    render json: @assigned
  end

  def index
    @books = AssignedBook.all
    render json: @books
  end

  def create
    @assigned = current_user.assigned_books.create(assigned_params)
    
  
    if AssignedBook.find_student_book(params[:student_id],params[:book_id]).nil?
    
      @assigned.save
      render json: @assigned
    else

      render json: "book is aleardy taken"
    end
  end

  def destroy
    @assigned.destroy
    head :no_content
  end

  private

  def assigned_params
    params.require(:assigned_book).permit(:Book_Name, :Student_name, :student_id, :book_id)
  end

  def set_assigned_book
    @assigned = AssignedBook.find(params[:id])
  end
end
