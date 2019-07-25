class ImagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @course = Course.find(params[:course_id])
    @course.images.create(image_params.merge(user: current_user))
    redirect_to place_path(@course)
  end

  def show
    @image = Image.find(image_params[:image])
  end

  def index
    @images = Image.all
  end

  private

  def image_params
    params.require(:image).permit(:caption, :picture)
  end
end

end
