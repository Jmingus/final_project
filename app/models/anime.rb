class Anime < ActiveRecord::Base
  has_many :users, through: :user_animes
end
