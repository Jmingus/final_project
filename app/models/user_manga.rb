class UserManga < ActiveRecord::Base
  belongs_to :user
  belongs_to :manga

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end

  def second_api_call
    advanced_info = Hash.from_xml open("http://cdn.animenewsnetwork.com/encyclopedia/api.xml?anime=#{@mangas.api_id}").read
    advanced_info
  end
end
