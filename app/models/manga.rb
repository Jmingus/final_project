class Manga < ActiveRecord::Base
  has_many :users, through: :user_mangas
  paginates_per 7
  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end
end
