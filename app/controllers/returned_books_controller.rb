class ReturnedBooksController < ApplicationController
	before_action :set_returned, only: [:show]


	def show 
		render json: @returned
	end

	# def index
	#    @returned_books = ReturnedBook.all 
	#    render json: @returned_books 
	# end

	def create		
		@book = current_user.returned_books.create(returned_book_params)
        byebug
		finding_student_book(params[:student_id], params[:book_id])

		return "no records found" if finding_student_book.nil?

		if @book.save 
			render json: @book, status: :created 
        else 
        	render json: @book.errors
        end
    end

	private 

    def returned_book_params
    	
    	params.require(:returned_book).permit( :student_id, :book_id, :Returend_Date )
    end
	def set_returned 
        @returned = ReturnedBook.find(params[:id])
    end
end
