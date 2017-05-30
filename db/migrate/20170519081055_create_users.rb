class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.timestamps
    end

    add_foreign_key :activities, :users, name: 'fk_activities_user_id'
  end
end
