class Anime < ActiveRecord::Base
  has_many :users, through: :user_animes

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end
end
