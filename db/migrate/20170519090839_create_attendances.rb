class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.string :name, limit: 50, null: false
      t.string :cellphone, limit: 20, null: false
      t.bigint :activity_id, null: false
      t.timestamps
    end

    add_foreign_key :attendances, :activities, name: 'fk_attendances_activity_id'
  end
end
