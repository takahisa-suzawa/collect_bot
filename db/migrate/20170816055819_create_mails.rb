class CreateMails < ActiveRecord::Migration[5.1]
  def change
    drop_table :mails
    create_table :mails do |t|
      t.string :title
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
