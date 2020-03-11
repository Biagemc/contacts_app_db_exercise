class ChangeLatitudeToDecimal < ActiveRecord::Migration[6.0]
  def change
    change_column :contacts, :latitude, "numeric USING CAST(latitude AS numeric)"
    # change_column :contacts, :latitude, precision: 9, scale: 2
    change_column :contacts, :longitude, "numeric USING CAST(longitude AS numeric)"
    # change_column :contacts, :longitude, precision: 9, scale: 2
  end
end
