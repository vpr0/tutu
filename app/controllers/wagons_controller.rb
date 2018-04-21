class WagonsController < ApplicationController
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]

  def index
    @wagons = Wagon.all
  end

  def show
  end

  def new
    @wagon = Wagon.new
  end

  def edit
  end

  def create
    @wagon = Wagon.new(wagon_params)
    if @wagon.save
      redirect_to @wagon, notice: 'Wagon was successfully created.'
    else
      render :new
    end
  end

  def update
    train = Train.find_by(id: wagon_params[:train_id])
    if train && @wagon.update(wagon_params)
      @wagon.train = train
      redirect_to @wagon, notice: 'Wagon was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @wagon.destroy
    redirect_to wagons_url, notice: 'Wagon was successfully destroyed.'
  end

  private

  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  def wagon_params
    params.require(:wagon).permit(:number, :wagon_type, :seats_up, :seats_down, :train_id,)
  end
end