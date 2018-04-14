class Ticket < ApplicationRecord
  validates :number, :start_station_id, :end_station_id, :train_id, :user_id, presence: true

  belongs_to :train
  belongs_to :user
end