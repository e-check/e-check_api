class CreateJinshujuEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :jinshuju_entries do |t|
      t.string :cellphone
      t.string :form_id
      t.text :raw_data
      t.timestamps
    end
  end
end