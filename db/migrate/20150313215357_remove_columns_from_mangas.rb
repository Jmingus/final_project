class RemoveColumnsFromMangas < ActiveRecord::Migration
  def change
    remove_column :mangas, :finished
    remove_column :mangas, :favorite
  end
end
