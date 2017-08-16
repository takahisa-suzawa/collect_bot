class RenameColumnToReports < ActiveRecord::Migration[5.1]
  def change
    rename_column :reports, :accepted_date, :accepting_timestamp
    rename_column :reports, :report_date, :closed_timestamp
  end
end
