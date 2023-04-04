class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(book.id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private  
  # ストロングパラメータ
  # ストロングパラメータは受け取る値に制限をかけている
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
