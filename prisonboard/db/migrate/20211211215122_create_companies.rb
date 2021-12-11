class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :address
      t.string :full_name
      t.string :short_name

      t.timestamps
    end
  end
end
