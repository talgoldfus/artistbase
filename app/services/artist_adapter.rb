module Services
  class ArtistAdapter
    def get_media

      response = Services::CooperMuseumClient.new.grab_media

      response.parsed_response["objects"].each do |item|

      artist=Artist.create( Services::CooperMuseumClient.new.grab_artist(item["participants"].first["person_id"])  )


      image_collection=ImageCollection.create( Services::CooperMuseumClient.new.grab_collection(item[]))


      medium= Medium.create(name: item["title_raw"], genre: item["type"], img_link: item["images"].first["b"]["url"] )


      end



    def method
    end

    end
  end
end


# module Services
#   class ArtistAdapter
#     def get_artists#(artist_name)
#       response = Services::HarvardClient.new.create_artists
#         i = Artist.all.count + 1
#       response.parsed_response["records"].each do |item|
#         Artist.create(name: item["people"][0]["name"], bio: "testing", abstract: "testing", username: "artist#{i}",
#           password: "flatiron", img_link: item["primaryimageurl"])
#         i += 1
#       end
#     end
#   end
# end
