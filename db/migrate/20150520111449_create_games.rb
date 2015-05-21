class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.date :date
      t.integer :amount, default: 1800

      t.timestamps null: false
    end
  end
end
