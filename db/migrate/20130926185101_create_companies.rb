class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false

      t.timestamps
    end

   add_column :owners, :company_id, :integer
  end
end
