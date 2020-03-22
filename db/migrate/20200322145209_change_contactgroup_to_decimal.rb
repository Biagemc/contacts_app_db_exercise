class ChangeContactgroupToDecimal < ActiveRecord::Migration[6.0]
  def change
    change_column :contact_groups, :contact_id, :decimal, precision: 9, scale: 2
    change_column :contact_groups, :group_id, :decimal, precision: 9, scale: 2
  end
end
