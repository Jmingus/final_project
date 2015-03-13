class RemoveColumnsFromUserMangas < ActiveRecord::Migration
  def change
    remove_column :user_mangas, :api_id
    remove_column :user_mangas, :name
    remove_column :user_mangas, :vintage
    remove_column :user_mangas, :api_gid
    remove_column :user_mangas, :image
    remove_column :user_mangas, :plot_summary
  end
end
