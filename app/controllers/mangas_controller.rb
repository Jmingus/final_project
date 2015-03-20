class MangasController < ApplicationController
  before_action :set_manga, only: [:deletecollection]
  def index
    @mangas = (Manga.all - current_user.mangas)
    @paginatable_mangas = Kaminari.paginate_array(@mangas).page(params[:page]).per(7)
    if params[:search]
      @mangas = Manga.search(params[:search]).order("created_at DESC") - current_user.mangas
      @paginatable_mangas = Kaminari.paginate_array(@mangas).page(params[:page]).per(7)
    else
      @mangas = Manga.all.order("created_at DESC") - current_user.mangas
      @paginatable_mangas = Kaminari.paginate_array(@mangas).page(params[:page]).per(7)
    end
  end
  def collection
    @user = current_user
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
    user_id = current_user.id
   if UserManga.where(manga_id: params[:id], user_id: current_user.id)[0].toggle!(:favorite)
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
