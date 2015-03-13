class AddingColumnsToUserAnime < ActiveRecord::Migration
  def change
    add_column :user_animes, :finished, :boolean, default: false
    add_column :user_animes, :favorite, :boolean, default: false
  end
end
