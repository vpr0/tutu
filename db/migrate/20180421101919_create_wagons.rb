class CreateWagons < ActiveRecord::Migration[5.1]
  def change
    create_table :wagons do |t|
      t.integer :number
      t.integer :seats_up
      t.integer :seats_down
      t.integer :train_id
      t.string  :wagon_type

      t.timestamps
    end
  end
end
