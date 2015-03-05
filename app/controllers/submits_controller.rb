class SubmitsController < ApplicationController
  before_action :authenticate_admin, only: [:index, :show, :edit, :update, :delete, :destroy]

  def index
    @submits = Submit.order('created_at DESC')
  end

  def thanks
  end

  def show
    @submit = Submit.find(params[:id])
  end

  def new
    @submit = Submit.new
  end

  def create
    @submit = Submit.new(submit_params)
    if @submit.save
      SubmitMailer.submit_thanks(@submit).deliver_now
      redirect_to(:action=>'thanks')
    else
      render('new')
    end
  end

  def edit
      @submit = Submit.find(params[:id])
  end

  def update
      @submit = Submit.find(params[:id])
      if @submit.update_attributes(submit_params)
        flash[:notice] = "Submission has been edited... You goddamn totalitarian dictator."
        redirect_to(:action=>'show')
      else
        render('edit')
      end
  end

  def delete
    @submit = Submit.find(params[:id])
  end

  def destroy
    @submit = Submit.find(params[:id]).destroy
    flash[:notice] = "#{@submit.name}'s application has been REJECTED. You can try Sears"
    redirect_to(:action=>'index')
  end

  private

  def submit_params
    params.require(:submit).permit(:title, :name, :location, :image, :email, :review, :agree)
  end

  def authenticate_admin
    if admin_signed_in?
    else
      redirect_to('/')
    end
  end

end
