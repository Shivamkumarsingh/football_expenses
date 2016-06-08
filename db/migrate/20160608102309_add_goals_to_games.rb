class AddGoalsToGames < ActiveRecord::Migration
  def change
    add_column :games, :goals, :integer, default: 0
  end
end
