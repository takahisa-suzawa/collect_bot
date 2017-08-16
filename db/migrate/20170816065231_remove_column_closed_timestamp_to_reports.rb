class RemoveColumnClosedTimestampToReports < ActiveRecord::Migration[5.1]
  def change
    remove_column :reports, :accepting_timestamp, :timestamp
    remove_column :reports, :closed_timestamp, :timestamp
  end
end
