# frozen_string_literal: true

class StudentsController < ApplicationController
  before_action :set_student, only: %i[show update destroy]
  before_action :check_login, only: %i[create delete update]
  def show
    if @student.image.attached?

      render json: { student: @student, image_url: url_for(@student.image) }
    else
      render json: { student: @student, image_url: nil }
    end
  end

  def index
    @students = Student.all
    
    arr = []
    @students.each do |s|
      student = {}
      student[:data] = s
      student[:image] = url_for(s.image) if s.image.attached?
      student[:image] = nil unless s.image.attached?
      arr << student
    end
    render json: { student: arr }
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
    if @student.update(student_params)
      render json: @student
    else
      render json: @student.errors
    end
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
