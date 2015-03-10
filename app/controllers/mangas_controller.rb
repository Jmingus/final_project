require 'open-uri'
class MangasController < ApplicationController
  def index
    query = params.fetch(:query)
    url = "http://cdn.animenewsnetwork.com/encyclopedia/api.xml?type=manga&name=Poppoya"
    response = Hash.from_xml @xml
    @results = response["results"]
  end
end
