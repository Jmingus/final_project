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
            if advanced_info['ann']['manga']['info'].class == Array
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
          image_url.each do |image_item|
          Manga.create({ name: elem['name'],
                             api_id: elem['id'],
                             api_gid: elem['gid'],
                             image: image_item,
                             plot_summary: plot,
                             vintage: elem['vintage']
                           })
          end
          if Manga.where(image: "[]")
            Manga.where(image: "[]").each do |data|
              data.update_attribute(:image, "Not Available")
            end
          elsif Manga.where(image: "[nil]")
            Manga.where(image: "[nil]").each do |data|
              data.update_attribute(:image, "Not Available")
            end
          end

          if Manga.where(plot_summary: "[]")
            Manga.where(plot_summary: "[]").each do |data|
              data.update_attribute(:plot_summary, "Not Available")
            end
          elsif Manga.where(plot_summary: "[nil]")
            Manga.where(plot_summary: "[nil]").each do |data|
              data.update_attribute(:plot_summary, "Not Available")
            end
          end
      elsif elem['type'] == 'TV'
        if Anime.find_by(api_id: elem['id'])
          next
        else
            advanced_info = Hash.from_xml open("http://cdn.animenewsnetwork.com/encyclopedia/api.xml?anime=#{elem['id']}").read
          plot = []
          extra = []
          image_url = []
          if advanced_info['ann']['anime']['info'].class == Array
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
        image_url.each do |image_item|
        Anime.create({ name: elem['name'],
                           api_id: elem['id'],
                           api_gid: elem['gid'],
                           image: image_item,
                           plot_summary: plot,
                           vintage: elem['vintage']
                         })
        end
        if Anime.where(image: "[]")
          Anime.where(image: "[]").each do |data|
            data.update_attribute(:image, "Not Available")
          end
        elsif Anime.where(image: "[nil]")
          Anime.where(image: "[nil]").each do |data|
            data.update_attribute(:image, "Not Available")
          end
        end

        if Anime.where(plot_summary: "[]")
          Anime.where(plot_summary: "[]").each do |data|
            data.update_attribute(:plot_summary, "Not Available")
          end
        elsif Anime.where(plot_summary: "[nil]")
          Anime.where(plot_summary: "[nil]").each do |data|
            data.update_attribute(:plot_summary, "Not Available")
          end
        end
        end
      rescue REXML::ParseException => error
        puts error
      end
    end