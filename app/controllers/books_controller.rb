# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :check_login, only: %i[create update]
  before_action :set_book, only: %i[show update destroy]
  def show
    render json: @book
  end

  def index
    @books = Book.all
    render json: @books
  end

  def create
    book = current_user.books.create(book_params)
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
    params.require(:book).permit(:name, :price, :writter, :pages, :image)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
