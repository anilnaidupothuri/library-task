# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :check_login, only: %i[create update]
  before_action :set_book, only: %i[show update destroy]
  def show
    if @book.image.attached?

      # cover_url = rails_blob_path(@book.image, disposition: "attachment", only_path: true)
      # render json: {book:@book, image: "http://localhost:3000#{cover_url}"}
      render json: { book: @book, image: url_for(@book.image) }
    else
      render json: { book: @book, image: nil }
    end
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
