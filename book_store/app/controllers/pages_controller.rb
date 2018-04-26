class PagesController < ApplicationController

  def index
  end

  def authors
    @authors = Author.all
    not_authorised unless current_user.has_role?(:authors) || current_user.has_role?(:admin)
  end

  def books
    not_authorised unless current_user.has_role?(:books) || current_user.has_role?(:admin)
    @books = Book.all
    @books = @books.public_send(:title, params[:title]) if params[:title].present?
    @books = @books.public_send(:rating, params[:rating]) if params[:rating].present?
    @books = Author.all.public_send(:author, params[:author]).first.books if params[:author].present?
    @books = @books.public_send(:min_price, params[:min_price]) if params[:min_price].present?
    @books = @books.public_send(:max_price, params[:max_price]) if params[:max_price].present?
  end

  def show_book
    @book = Book.find(params[:id])
  end

  def author_books
    @author = Author.find(params[:id])
  end

  def stores
    @stores = Store.all
    not_authorised unless current_user.has_role?(:stores) || current_user.has_role?(:admin)
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

  private
  def not_authorised
    flash[:notice] = "You are not authorised"
    redirect_to(root_path)
  end
  # def filter_params
  #   params.slice(:tits)
  # end
end
