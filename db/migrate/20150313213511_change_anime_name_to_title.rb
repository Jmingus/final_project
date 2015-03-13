class ChangeAnimeNameToTitle < ActiveRecord::Migration
  def change
    rename_column :animes, :title, :name
  end
end
