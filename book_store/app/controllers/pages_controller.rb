class PagesController < ApplicationController

  def index
  end

  def authors
    @authors = Author.all
  end

  def books
    @books = Book.all
  end

  def show_book
    @book = Book.find(params[:id])
  end

  def author_books
    @author = Author.find(params[:id])
  end

  def stores
    @stores = Store.all
  end

  def show_store
    @store = Store.find(params[:id])
  end

  def location
    @stores = Store.near(params[:input])
    rescue
      flash.now[:notice] = "Error"
      redirect_to(action: 'stores')
      # will run when an error occurs
  end

end
