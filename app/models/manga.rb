class Manga < ActiveRecord::Base
  has_many :user_mangas
  has_many :users, through: :user_mangas
  paginates_per 7
  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end

  def toggle_manga_favorite
    if UserManga.where(manga_id: params[:id], user_id: current_user.id)[0].favorite == false
       UserManga.where(manga_id: params[:id], user_id: current_user.id)[0].update_attribute(:favorite, true)
    else UserManga.where(manga_id: params[:id], user_id: current_user.id)[0].favorite == true
        UserManga.where(manga_id: params[:id], user_id: current_user.id)[0].update_attribute(:favorite, false)
    end
  end

  def toggle_manga_finished
    if UserManga.where(manga_id: params[:id], user_id: current_user.id)[0].finished == false
      UserManga.where(manga_id: params[:id], user_id: current_user.id)[0].update_attribute(:finished, true)
    else UserManga.where(manga_id: params[:id], user_id: current_user.id)[0].finished == true
    UserManga.where(manga_id: params[:id], user_id: current_user.id)[0].update_attribute(:finished, false)
    end
  end
end
