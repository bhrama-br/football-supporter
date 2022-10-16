class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.text :message
      t.belongs_to :player
      t.timestamps
    end
  end
end
