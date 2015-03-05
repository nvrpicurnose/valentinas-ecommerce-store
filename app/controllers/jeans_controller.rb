class JeansController < ApplicationController
  before_action :authenticate_admin, only: [:new, :create, :edit, :update, :delete, :destroy]

  def index
    @jeans = Jean.sorted
  end

  def show
    @jean = Jean.find(params[:id])
  end

  def new
    @jean = Jean.new
  end

  def create
    @jean = Jean.new(jean_params)
    if @jean.save
      flash[:notice] = "Jean Model was successfully saved!"
      redirect_to(:action=> 'index')
    else
      render('new')
    end
  end

  def edit
    @jean = Jean.find(params[:id])
  end

  def update
    @jean = Jean.find(params[:id])
    if @jean.update_attributes(jean_params)
      flash[:notice] = "Jean Model was successfully updated!"
      redirect_to(:action=>'show', :id=>@jean.id)
    else
      render('edit')
    end
  end

  def delete
    @jean = Jean.find(params[:id])
  end

  def destroy
    @jean = Jean.find(params[:id]).destroy
    flash[:notice] = "Jean Model '#{@jean.title}' successfully deleted!"
    redirect_to(:action=>'index')
  end

  private

  def jean_params
    params.require(:jean).permit(:title, :price, :description, :size, :image, :position)
  end

  def authenticate_admin
    if admin_signed_in?
    else
      redirect_to(:action=>'index')
    end
  end

end
