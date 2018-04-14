class AddRailwayStationIdAndUserIdToTickets < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :tickets, :user
    add_belongs_to :tickets, :railway_station
  end
end
