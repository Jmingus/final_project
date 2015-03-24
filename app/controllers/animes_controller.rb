class AnimesController < ApplicationController
  before_action :set_anime, only: [:deletecollection]
  def index
    if params[:search]
      if current_user.animes.count <= 0
        @animes = Anime.search(params[:search]).order("created_at DESC")
      else
        @animes = Anime.where('id NOT IN (?)', current_user.animes.pluck(:id)).search(params[:search]).order("created_at DESC")
      end
      @paginatable_animes = @animes.page(params[:page]).per(7)
    else
      if current_user.animes.count <= 0
        @animes = Anime.search(params[:search]).order("created_at DESC")
      else
        @animes = Anime.where('id NOT IN (?)', current_user.animes.pluck(:id)).order('NAME')
      end
      @paginatable_animes = @animes.page(params[:page]).per(7)
    end
  end

  def collection
    @user = current_user
  end

  def addcollection
    user_id = current_user.id
    if UserAnime.create(user_id: user_id, anime_id: params[:id])
      redirect_to user_animes_path, flash: {notice: 'Anime added to collection'}
    else
      redirect_to user_animes_path, flash: {notice: 'Anime failed to be added'}
    end
  end

  def switch_favorite
    if UserAnime.where(anime_id: params[:id], user_id: current_user.id)[0].toggle_anime_favorite
      render json: "Success", status: 200
    else
      render json: "Failure", status: 500
    end
  end

  def switch_finished
    if UserAnime.where(anime_id: params[:id], user_id: current_user.id)[0].toggle_anime_finished
      render json: "Success", status: 200
    else
      render json: "Failure", status: 500
    end
  end

  def deletecollection

  end

  private

  def set_anime
    @anime = Anime.find(params[:id])
  end
  def anime_params
    params.require(:anime).permit(:title,:plot_summary,:image)
  end
end
