class UserManga < ActiveRecord::Base
  belongs_to :user
  belongs_to :manga

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end
end
