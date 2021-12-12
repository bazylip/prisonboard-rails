class CreateInmates < ActiveRecord::Migration[6.1]
  def change
    create_table :inmates do |t|
      t.string :name
      t.string :surname
      t.string :pesel
      t.float :average_rating
      t.boolean :hired
      t.date :birth_date

      t.timestamps
    end
  end
end
