class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def new
    @book= Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    
    if @book.save
       flash[:notice] ="Book was successfully created."
       redirect_to book_path(@book.id)
    else   
       @books = Book.all
       render :index
    end   
  end  

  def index
    @books = Book.all
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    @books = Book.all
  end
  
  def update
    
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def is_matching_login_user
    @book = Book.find(params[:id])
    @user = @book.user
    unless @user == current_user
      redirect_to books_path
    end
  end  
  
end
