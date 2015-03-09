class CreateMangas < ActiveRecord::Migration
  def change
    create_table :mangas do |t|
      t.string :title, null: false
      t.string :plot_summary, default: 'Not Available'
      t.string :image, default: 'Not Available'
      t.integer :rating, default: 1
      t.belongs_to :user, index: true
      t.boolean :finished, default: false
      t.boolean :favorite, default: false
      t.timestamps null: false
    end
    add_foreign_key :mangas, :users
  end
end
