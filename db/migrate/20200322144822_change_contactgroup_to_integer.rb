class ChangeContactgroupToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :contact_groups, :contact_id, "numeric USING CAST(contact_id AS numeric)"
    change_column :contact_groups, :group_id, "numeric USING CAST(group_id AS numeric)"
  end
end
