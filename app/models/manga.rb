class Manga < ActiveRecord::Base
  has_many :users, through: :user_mangas

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end
end
