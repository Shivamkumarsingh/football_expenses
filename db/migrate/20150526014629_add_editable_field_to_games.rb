class AddEditableFieldToGames < ActiveRecord::Migration
  def change
    add_column :games, :editable, :boolean, default: true
  end
end
