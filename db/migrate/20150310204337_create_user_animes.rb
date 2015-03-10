class CreateUserAnimes < ActiveRecord::Migration
  def change
    create_table :user_animes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :anime, index: true
      t.string :api_id
      t.string :name
      t.string :vintage
      t.string :api_gid

      t.timestamps null: false
    end
    add_foreign_key :user_animes, :users
    add_foreign_key :user_animes, :animes
  end
end
