# frozen_string_literal: true

class StudentsController < ApplicationController
  before_action :set_student, only: %i[show update destroy]
  before_action :check_login, only: %i[create delete update]
  def show
    render json: @student
  end

  def index
    @students = Student.all
    render json: @students
  end

  def create
    @student = current_user.students.create(student_params)
    if @student.save
      render json: @student, status: :created
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  def update
    @student.update(student_params)
    render json: @student
  end

  def destroy
    @student.destroy
    head :no_content
  end

  private

  def student_params
    params.require(:student).permit(:name, :study, :address, :image)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end
