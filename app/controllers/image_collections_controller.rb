class ImageCollectionsController < ApplicationController

    def new
      @image_collection=ImageCollection.new
      5.times {@image_collection.media << Medium.new}
    end

    def create
      @artist = Artist.find(session[:artist_id])

      @image_collection=ImageCollection.create(artist_id: @artist.id ,name: params[:image_collection][:name])


      @image_collection.update(image_collection_params)


      @image_collection.randomize_profile_picture

      @image_collection.save
  
      redirect_to image_collection_path(@image_collection)
    end




    def show
      @image_collection=ImageCollection.find(params[:id])
    end

    def edit
      @image_collection=ImageCollection.find(params[:id])
    end

    def update
       @image_collection=ImageCollection.find(params[:id])

       @image_collection.update(image_collection_params)

       redirect_to image_collection_path(@image_collection)
    end



    private

    def image_collection_params
      params.require(:image_collection).permit(
        :name,

        media_attributes: [
          :id,
          :name,
          :genre,
          :img_link
                  ])
    end

end
