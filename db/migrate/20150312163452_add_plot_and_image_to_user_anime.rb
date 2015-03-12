class AddPlotAndImageToUserAnime < ActiveRecord::Migration
  def change
    add_column :user_animes, :image, :string, default: "Not Available"
    add_column :user_animes, :plot_summary, :string, default: "Not Available"
  end
end
