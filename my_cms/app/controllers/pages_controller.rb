class PagesController < ApplicationController

  layout 'admin'

  # as per comment in _form we can now remove this below
  before_action :find_subjects, only: [:new, :create, :edit, :update]
  before_action :find_subject
  before_action :set_page_count, only: [:new, :create, :edit, :update]

  before_action :confirm_logged_in

  def index
    # @pages = Page.all
    @pages = @subject.pages.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new(subject_id: @subject.id)
  end

  def create
    @page = Page.new(page_params)
    # as per comment in _form
    @page.subject_id = @subject.id
    if @page.save
      flash[:notice] = 'Successfully saved page'
      redirect_to(pages_path(subject_id: @subject.id))
    else
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = 'Successfully saved page'
      redirect_to(page_path(@page, subject_id: @subject.id))
    else
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = 'Successfully deleted page'
    redirect_to(pages_path(subject_id: @subject.id))
  end

  private

  def page_params
    params.require(:page).permit(:subject_id, :name, :position, :visible, :permalink)
  end

  def find_subject
    @subject = Subject.find(params[:subject_id])
  end

  def find_subjects
    @subjects = Subject.sorted
  end

  def set_page_count
    @page_count = Page.count
    if params[:action] == 'new' || params[:action] =='create'
      @page_count += 1
    end
  end

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in"
      redirect_to(access_login_path)
    end
  end


end
