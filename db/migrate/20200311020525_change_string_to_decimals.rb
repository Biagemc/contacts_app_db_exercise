class ChangeStringToDecimals < ActiveRecord::Migration[6.0]
  def change
    change_column :contacts, :latitude, :decimal, precision: 9, scale: 2
    change_column :contacts, :longitude, :decimal, precision: 9, scale: 2
  end
end
