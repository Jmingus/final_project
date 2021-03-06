class MangasController < ApplicationController
  before_action :set_manga, only: [:deletecollection]
  def index
    if params[:search]
      if current_user.mangas.count <= 0
        @mangas = Manga.search(params[:search]).order("created_at DESC")
      else
        @mangas = Manga.where('id NOT IN (?)', current_user.mangas.pluck(:id)).search(params[:search]).order("created_at DESC")
      end
        @paginatable_mangas = @mangas.page(params[:page]).per(7)
    else
      if current_user.mangas.count <= 0
        @mangas = Manga.search(params[:search]).order("created_at DESC")
      else
        @mangas = Manga.where('id NOT IN (?)', current_user.mangas.pluck(:id)).order('NAME')
      end
      @paginatable_mangas = @mangas.page(params[:page]).per(7)
    end
  end

  def full_collection
    @currently_reading = Manga.currently_reading(current_user)
  end

  def full_read
    @finished_manga_list = Manga.finished_reading(current_user)
  end

  def addcollection
    user_id = current_user.id
    if UserManga.create(user_id: user_id, manga_id: params[:id])
        redirect_to user_mangas_path, flash: {notice: 'Manga added to collection'}
    else
        redirect_to user_mangas_path, flash: {notice: 'Manga failed to be added'}
    end
  end

  def deletecollection

  end

  def switch_favorite
   if UserManga.where(manga_id: params[:id], user_id: current_user.id)[0].toggle_manga_favorite
     render json: "Success", status: 200
   else
     render json: "Failure", status: 500
   end
  end
    def switch_finished
      if UserManga.where(manga_id: params[:id], user_id: current_user.id)[0].toggle_manga_finished
        render json: "Success", status: 200
      else
        render json: "Failure", status: 500
      end
    end

  private

  def set_manga
    @manga = Manga.find(params[:id])
  end
  def manga_params
    params.require(:manga).permit(:title,:plot_summary,:image)
  end
end
