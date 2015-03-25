class UsersController < ApplicationController
  def dashboard
  end

  def profile_page
  end

  def show
    @currently_reading   = Manga.currently_reading(current_user)
    @finished_manga_list = Manga.finished_reading(current_user)
    @finished_anime_list = Anime.where(id: current_user.user_animes.where(finished: true).pluck(:anime_id))
    @currently_watching  = Anime.where(id: current_user.user_animes.where(finished: false).pluck(:anime_id))



    users_with_same_manga = []
    other_users_manga = []
    main_user_manga = UserManga.where(user_id: current_user.id, favorite: true).pluck(:manga_id)
    all_users_manga = UserManga.all.where(favorite: true).pluck(:user_id, :manga_id)
    all_users_manga.each do |u_id, m_id|
      if main_user_manga.include?(m_id)
        users_with_same_manga.push(u_id)
      end
    end
    users_with_same_cleaned_manga = users_with_same_manga.uniq
    users_with_same_cleaned_manga.each do |elem|
      other_users_manga.push(UserManga.where(user_id: elem, favorite: true).pluck(:manga_id))
    end
    manga_recommendations = Manga.where(id: other_users_manga.flatten)
    users_with_same_anime = []
    other_users_anime = []
    main_user_anime = UserAnime.where(user_id: current_user.id, favorite: true).pluck(:anime_id)
    all_users_anime = UserAnime.all.where(favorite: true).pluck(:user_id, :anime_id)
    all_users_anime.each do |u_id, m_id|
      if main_user_anime.include?(m_id)
        users_with_same_anime.push(u_id)
      end
    end
    users_with_same_cleaned_anime = users_with_same_anime.uniq
    users_with_same_cleaned_anime.each do |elem|
      other_users_anime.push(UserAnime.where(user_id: elem, favorite: true).pluck(:anime_id))
    end
    anime_recommendations = Anime.where(id: other_users_anime.flatten)

    @recommendations = manga_recommendations + anime_recommendations
  end

  def read

  end

end
