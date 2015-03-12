class AddPlotAndImageToUserManga < ActiveRecord::Migration
  def change
    add_column :user_mangas, :image, :string, default: "Not Available"
    add_column :user_mangas, :plot_summary, :string, default: "Not Available"
  end
end
