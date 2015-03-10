# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    response = Hash.from_xml open('http://www.animenewsnetwork.com/encyclopedia/reports.xml?id=155&nlist=all').read
    response['report']['item'].each do |elem|
      if elem['type'] == 'manga'
        UserManga.create({ name: elem['name'],
                           api_id: elem['id'],
                           api_gid: elem['gid'],
                           vintage: elem['vintage']
                         })
      elsif elem['type'] == 'TV'
        UserAnime.create({ name: elem['name'],
                           api_id: elem['id'],
                           api_gid: elem['gid'],
                           vintage: elem['vintage']
                         })
      end
    end