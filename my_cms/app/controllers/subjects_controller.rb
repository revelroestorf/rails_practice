class SubjectsController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in

  def index
    @subjects = Subject.all.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
    @subject_count = Subject.count + 1

  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to(subjects_path)
      flash[:notice] = "Successfully created subject"
    else
      @subject_count = Subject.count + 1
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      redirect_to(subject_path(@subject))
      flash[:notice] = "Successfully updated subject"
    else
      @subject_count = Subject.count
      render('edit')
      flash[:notice] = ""
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    redirect_to(subjects_path)
    flash[:notice] = "Successfully deleted #{Subject.name}"
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in"
      redirect_to(access_login_path)
    end
  end

end
