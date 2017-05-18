class CreateCheckins < ActiveRecord::Migration[5.1]
  def change
    create_table :checkins do |t|
      t.string :name, limit: 50
      t.string :cellphone, limit: 20
      t.string :form_id, limit: 50

      t.timestamps
    end
  end
end
