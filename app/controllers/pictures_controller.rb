class PicturesController < ApplicationController
  before_action :set_picture, only: [:show]

  def create
    @picture = Picture.new(picture_params)

    if @picture.save
      redirect_to @picture
    else
      redirect_to root_path
    end
  end

  def show
  end

  private
    def set_picture
      @picture = Picture.find(params[:id])
    end

    def picture_params
      params.require(:picture).permit(:file)
    end

end
