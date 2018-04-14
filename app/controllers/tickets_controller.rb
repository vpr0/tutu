class TicketsController < ApplicationController

  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.train = Train.find(params[:ticket][:train_id])
    @ticket.user = User.find(params[:ticket][:user_id])
    @ticket.start_station_id = params[:ticket][:start_station_id]
    @ticket.end_station_id = params[:ticket][:end_station_id]

    if @ticket.save
      redirect_to @ticket
    else
      render 'new'
    end
  end

  def update
    @ticket = Ticket.find(params[:id])

    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      render 'edit'
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    redirect_to tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:number, :train_id, :user_id, :start_station_id, :end_station_id)
  end
end