class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.timestamp :begin_posted_date
      t.timestamp :end_posted_date
      t.text :infomation

      t.timestamps
    end
  end
end
