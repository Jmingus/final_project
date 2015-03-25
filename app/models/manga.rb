class Manga < ActiveRecord::Base
  has_many :user_mangas
  has_many :users, through: :user_mangas
  paginates_per 7

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end

  def self.currently_reading(user)
    user_mangas_collection(user, false)
  end

  def self.finished_reading(user)
    user_mangas_collection(user, true)
  end

  private
  def self.user_mangas_collection(user, finished)
    where(id: user.user_mangas.where(finished: finished).pluck(:manga_id))
  end
end
