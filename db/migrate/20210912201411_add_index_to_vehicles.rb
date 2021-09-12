class AddIndexToVehicles < ActiveRecord::Migration[6.0]
  def change
    add_index :vehicles, :uid, unique: true
  end
end
