class CreateSkillsUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :skills_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end

    add_index :skills_users, [:user_id, :skill_id], unique: true
  end
end
