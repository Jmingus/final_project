class AddingColumnsToUserManga < ActiveRecord::Migration
  def change
    add_column :user_mangas, :finished, :boolean, default: false
    add_column :user_mangas, :favorite, :boolean, default: false
  end
end
