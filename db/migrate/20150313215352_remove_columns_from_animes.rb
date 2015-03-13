class RemoveColumnsFromAnimes < ActiveRecord::Migration
  def change
    remove_column :animes, :finished
    remove_column :animes, :favorite
  end
end
