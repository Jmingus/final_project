class RemoveColumnsFromUserAnimes < ActiveRecord::Migration
  def change
    remove_column :user_animes, :api_id
    remove_column :user_animes, :name
    remove_column :user_animes, :vintage
    remove_column :user_animes, :api_gid
    remove_column :user_animes, :image
    remove_column :user_animes, :plot_summary
  end
end
