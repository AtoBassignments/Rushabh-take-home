class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :uid, :null => false, :default => "", :limit => 191

      t.timestamps
    end
  end
end
