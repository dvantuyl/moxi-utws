class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :display_name
      t.string :uuid

      t.timestamps
    end
  end
end
