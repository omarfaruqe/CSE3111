class CreateTransportServices < ActiveRecord::Migration[5.1]
  def change
    create_table :transport_services do |t|
      t.string :BusSchedule
      t.string :BusType
      t.string :RouteInfo

      t.timestamps
    end
  end
end
