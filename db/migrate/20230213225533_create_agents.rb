class CreateAgents < ActiveRecord::Migration[7.0]
  def change
    create_table :agents do |t|
      t.string :display_name
      t.boolean :is_active
      t.string :company_uuid
      t.datetime :transferred_at

      t.timestamps
    end
  end
end
