class CreateMatchingPercentages < ActiveRecord::Migration[7.0]
  def change
    create_table :matching_percentages do |t|
      t.references :job, null: false, foreign_key: true
      t.references :jobseeker, null: false, foreign_key: true
      t.float :percentage, null: false, default: 0

      t.timestamps
    end

    add_index :matching_percentages, [:job_id, :jobseeker_id], unique: true
  end
end
