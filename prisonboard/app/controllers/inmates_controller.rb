class InmatesController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin"

  def index
    @inmates = Inmate.all
  end

  def show
    @inmate = Inmate.find(params[:id])
  end

  def new
    @inmate = Inmate.new
  end

  def create
    puts params
    @inmate = Inmate.new(inmate_params)

    if @inmate.save
      redirect_to @inmate
    else
      render :new
    end
  end

  def edit
    @inmate = Inmate.find(params[:id])
  end

  def update
    @inmate = Inmate.find(params[:id])

    if @inmate.update(inmate_params)
      redirect_to @inmate
    else
      render :edit
    end
  end

  def destroy
    @inmate = Inmate.find(params[:id])
    @inmate.destroy

    redirect_to inmates_path
  end

  private
  def inmate_params
    params.require(:inmate).permit(:name, :surname, :pesel, :average_rating, :hired, :birth_date)
  end

end
