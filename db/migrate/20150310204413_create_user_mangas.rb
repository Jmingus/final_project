class CreateUserMangas < ActiveRecord::Migration
  def change
    create_table :user_mangas do |t|
      t.belongs_to :user, index: true
      t.belongs_to :manga, index: true
      t.string :api_id
      t.string :name
      t.string :vintage
      t.string :api_gid

      t.timestamps null: false
    end
    add_foreign_key :user_mangas, :users
    add_foreign_key :user_mangas, :mangas
  end
end
