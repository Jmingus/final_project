# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    response = Hash.from_xml open('http://www.animenewsnetwork.com/encyclopedia/reports.xml?id=155&nlist=all').read
    response['report']['item'].each do |elem|
      begin
        if elem['type'] == 'manga'
          if Manga.find_by(api_id: elem['id'])
            next
          else
              advanced_info = Hash.from_xml open("http://cdn.animenewsnetwork.com/encyclopedia/api.xml?manga=#{elem['id']}").read
            plot = []
            extra = []
            image_url = []
            if advanced_info['ann'].class == Array && advanced_info['ann']['manga']['info'].class == Array
              image_url << advanced_info['ann']['manga']['info'][0]['src']
              advanced_info['ann']['manga']['info'].each do |element|
                if element.length >= 70
                  plot << element
                else
                  extra << element
                end
              end
            end
          end
          Manga.create({ name: elem['name'],
                             api_id: elem['id'],
                             api_gid: elem['gid'],
                             image: image_url,
                             plot_summary: plot,
                             vintage: elem['vintage']
                           })
      elsif elem['type'] == 'TV'
        if Anime.find_by(api_id: elem['id'])
          next
        else
            advanced_info = Hash.from_xml open("http://cdn.animenewsnetwork.com/encyclopedia/api.xml?anime=#{elem['id']}").read
          plot = []
          extra = []
          image_url = []
          if advanced_info['ann'].class == Array && advanced_info['ann']['anime']['info'].class == Array
            image_url << advanced_info['ann']['anime']['info'][0]['src']
            advanced_info['ann']['anime']['info'].each do |element|
              if element.length >= 70
                plot << element
              else
                extra << element
              end
            end
          end
        end
        Anime.create({ name: elem['name'],
                           api_id: elem['id'],
                           api_gid: elem['gid'],
                           image: image_url,
                           plot_summary: plot,
                           vintage: elem['vintage']
                         })
        end
      rescue REXML::ParseException => error
        puts error
      end
    end