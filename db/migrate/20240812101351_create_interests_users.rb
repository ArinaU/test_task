class CreateInterestsUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :interests_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :interest, null: false, foreign_key: true

      t.timestamps
    end

    add_index :interests_users, [:user_id, :interest_id], unique: true
  end
end
