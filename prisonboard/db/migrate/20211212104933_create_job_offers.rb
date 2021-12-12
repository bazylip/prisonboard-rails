class CreateJobOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :job_offers do |t|
      t.string :job_title
      t.float :hourly_rate
      t.integer :weekly_hours
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
