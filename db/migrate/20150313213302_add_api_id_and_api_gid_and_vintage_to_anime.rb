class AddApiIdAndApiGidAndVintageToAnime < ActiveRecord::Migration
  def change
    add_column :animes, :api_id, :string
    add_column :animes, :api_gid, :string
    add_column :animes, :vintage, :string, default: "Not Available"
  end
end
