class ChangeContactgroupToInteg < ActiveRecord::Migration[6.0]
  def change
    change_column :contact_groups, :contact_id, :integer
    change_column :contact_groups, :group_id, :integer
  end
end
