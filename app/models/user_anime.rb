class UserAnime < ActiveRecord::Base
  belongs_to :user
  belongs_to :anime

  def toggle_anime_favorite
    if favorite == false
      update_attribute(:favorite, true)
    else favorite == true
    update_attribute(:favorite, false)
    end
  end

  def toggle_anime_finished
    if finished == false
      update_attribute(:finished, true)
    else finished == true
    update_attribute(:finished, false)
    end
  end
end
