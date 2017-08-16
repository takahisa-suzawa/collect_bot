class RemoveColumnInfomationToReports < ActiveRecord::Migration[5.1]
  def change
    remove_column :reports, :infomation, :string
  end
end
