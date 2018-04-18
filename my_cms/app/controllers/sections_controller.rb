class SectionsController < ApplicationController

  layout 'admin'

  before_action :find_page

  before_action :confirm_logged_in

  def index
    # @sections = Section.all.sorted
    @sections = @page.sections.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(page_id: @page.id)
    @section_count = Section.count + 1
    @pages = Page.sorted
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      redirect_to(sections_path(page_id: @page.id))
      flash[:notice] = 'Successfully saved section'
    else
      @section_count = Section.count + 1
      @pages = Page.sorted
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
    @section_count = Section.count
    @pages = Page.sorted
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      redirect_to(section_path(@section, page_id: @page.id))
      flash[:notice] = 'Successfully saved section'
    else
      @section_count = Section.count
      @pages = Page.sorted
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = 'Successfully deleted section'
    redirect_to(sections_path(page_id: @page.id))
  end

  private

  def section_params
    params.require(:section).permit(:page_id, :name, :position,
      :visible, :content_type, :content)
  end

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in"
      redirect_to(access_login_path)
    end
  end

  def find_page
    @page = Page.find(params[:page_id])
  end


end
