class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :name, null: false
      t.string :form_id, null: false
      t.bigint :user_id, null: false
      t.timestamps
    end
  end
end
