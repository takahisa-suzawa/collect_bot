class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.timestamp :accepted_date
      t.timestamp :report_date
      t.text :infomation

      t.timestamps
    end
  end
end
