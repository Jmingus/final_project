class AddApiIdAndApiGidAndVintageToManga < ActiveRecord::Migration
  def change
    add_column :mangas, :api_id, :string
    add_column :mangas, :api_gid, :string
    add_column :mangas, :vintage, :string, default: "Not Available"
  end
end
