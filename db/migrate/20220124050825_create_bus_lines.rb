class CreateBusLines < ActiveRecord::Migration[7.0]
  def change
    create_table :bus_lines do |t|
      t.text :name

      t.timestamps
    end
  end
end
