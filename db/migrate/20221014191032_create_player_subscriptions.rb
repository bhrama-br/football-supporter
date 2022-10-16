class CreatePlayerSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :player_subscriptions do |t|
      t.belongs_to :user
      t.belongs_to :player
      t.timestamps
    end
  end
end
