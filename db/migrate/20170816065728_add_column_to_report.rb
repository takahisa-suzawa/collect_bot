class AddColumnToReport < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :deliver_date, :date
  end
end
