class CreateInfomations < ActiveRecord::Migration[5.1]
  def change
    create_table :infomations do |t|
      t.text :text
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
