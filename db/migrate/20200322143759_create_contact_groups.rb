class CreateContactGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_groups do |t|
      t.string :contact_id
      t.string :group_id

      t.timestamps
    end
  end
end
