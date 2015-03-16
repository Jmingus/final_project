class Anime < ActiveRecord::Base
  has_many :user_animes
  has_many :users, through: :user_animes
  paginates_per 7
  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end
end
