class CreateBusSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :bus_schedules do |t|
      t.bigint :departure_hour
      t.bigint :departure_minute
      t.bigint :bus_line_id

      t.timestamps
    end
  end
end
