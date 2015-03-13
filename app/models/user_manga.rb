class UserManga < ActiveRecord::Base
  belongs_to :user
  belongs_to :manga

end
