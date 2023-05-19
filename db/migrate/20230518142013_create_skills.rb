class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.string :name, null: false

      t.timestamps
    end

    # HABTM Jobs <-> Skills
    create_table :jobs_skills, id: false do |t|
      t.belongs_to :job
      t.belongs_to :skill
    end

    # HABTM Jobseekers <-> Skills
    create_table :jobseekers_skills, id: false do |t|
      t.belongs_to :jobseeker
      t.belongs_to :skill
    end
  end
end
