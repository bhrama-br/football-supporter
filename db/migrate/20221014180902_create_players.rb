class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.integer :number
      t.string :nationality
      t.date :birth_date
      t.string :position
      t.belongs_to :team
      t.timestamps
    end
  end
end
