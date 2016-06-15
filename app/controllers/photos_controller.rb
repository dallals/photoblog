class PhotosController < ApplicationController
	before_action :set_photo, only: [:edit, :update, :destroy, :require_same_user]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @photos = Photo.paginate(page: params[:page], per_page: 5).order(updated_at: :desc)
  end

  def new
    @photo = Photo.new
  end

  def show
  	@user = User.find(params[:id])
  	@photos = User.find(params[:id]).photos.paginate(page: params[:page], per_page: 5).order(updated_at: :desc)
  
  end

 
  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    if @photo.save	
      flash[:success] = "The photo was added!"
      redirect_to photo_path(current_user)
    else
      flash[:danger] = "Photo must be present and title must have a minimum of 3 letters or you exceeded the maximum number of photos allowed (20)"
      redirect_to :back
    end
  end

  def edit
    
  end

  def update
    if @photo.update(photo_params)
      flash[:success] = "photo was successfully updated"
      redirect_to photo_path(@photo.user_id)
    else
      flash[:danger] = "Photo was not updated"
      render :edit
    end 
  end

  def destroy
  	# @photo = Photo.find(params[:id])
  	@photo.destroy
  	flash[:danger] = "The photo was deleted"
  	redirect_to :back
  end	
  private

  def require_same_user
    if current_user != @photo.user and !current_user.admin?
      flash[:danger] = "You can only edit your own account"
      redirect_to photos_path
    end
  end

  def set_photo
  	@photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:image, :title)
  end

end