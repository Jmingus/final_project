class AnimesController < ApplicationController
  before_action :set_anime, only: [:deletecollection]
  def index
    if params[:search]
      @animes = Anime.where('id NOT IN (?)', current_user.animes.pluck(:id)).search(params[:search]).order("created_at DESC")
      @paginatable_animes = @animes.page(params[:page]).per(7)
    else
      @animes = Anime.where('id NOT IN (?)', current_user.animes.pluck(:id)).order('NAME')
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
