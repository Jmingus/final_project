class ChangeMangaNameToTitle < ActiveRecord::Migration
  def change
    rename_column :mangas, :title, :name
  end
end
