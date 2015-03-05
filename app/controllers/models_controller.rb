class ModelsController < ApplicationController
  before_action :authenticate_admin, only: [:new, :create, :edit, :update, :delete, :destroy]

  def index
    @models = Model.sorted
  end

  def show
    @model = Model.find(params[:id])
  end

  def new
    @model = Model.new
  end

  def create
    @model = Model.new(model_params)
    if @model.save
      SubmitMailer.model_notice(@model).deliver_now
      flash[:notice] = "Picture Model was successfully created!"
      redirect_to(:action=>'index')
    else
      render('new')
    end
  end

  def edit
    @model = Model.find(params[:id])
  end

  def update
    @model = Model.find(params[:id])
    if @model.update_attributes(model_params)
      flash[:notice] = "Picture Model was successfully updated!"
      redirect_to(:action=>'show', :id=>@model.id)
    else
      render('edit')
    end
  end

  def delete
    @model = Model.find(params[:id])
  end

  def destroy
    model = Model.find(params[:id]).destroy
    redirect_to(:action=>'index')
  end

  private

  def model_params
    params.require(:model).permit(:title, :name, :location, :email, :position, :image, :review)
  end

  def authenticate_admin
    if admin_signed_in?
    else
      redirect_to(:action=>'index')
    end
  end
end
