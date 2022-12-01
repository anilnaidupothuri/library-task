# frozen_string_literal: true

class BooksController < ApplicationController
	before_action :check_login, only: [:create, :update]
  before_action :set_book, only: %i[show update delete]
  def show
    render json: @book
  end

  def index
    @books = Book.all
    render json:@books
  end

  def create
    book = Book.create(book_params)
    if book.save
      render json: book, status: :created
    else
      render json: book.errors, status: :unprocessable_entity
    end
  end

  def update
    @book.update(book_params)
    render json: @book
  end

  def destroy
    @book.destroy
    head :no_content
  end

  private

  def book_params
    params.require(:book).permit(:name, :price, :writter, :pages)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end