class ArticlesController < ApplicationController
	before_action :set_article, only: [:edit, :update, :show, :destroy]
	before_action :require_user, except: [:index, :show]
	before_action :require_same_user, only: [:edit, :update, :destroy]


  def index
  	@articles = Article.paginate(page: params[:page], per_page: 5).order(updated_at: :desc)
  end

  def new
  	@article = Article.new
  	@photo = Photo.new
  end

  def create
  	@article = Article.new(article_params)
  	# @photo = Photo.new(photo_params)
  	@article.user = current_user
  	# @article.user_id = session[:user_id]
	if @article.save 
		flash[:success] = "Post was saved"
  		redirect_to article_path(@article)
  		else
  		render :new
  	end	
  end

  def show
  	# @user = User.find(params[:id])
    # @photo = Photo.find(params[:id])
  end

  def destroy
  	
  	@article.destroy
  	flash[:danger] = "Post was destroyed"
  	redirect_to articles_path
  end

  def edit
  	
  end

  def update
  	
  	if @article.update(article_params)
  		flash[:success] = "Post was successfully updated"
  		redirect_to article_path(@article)
  	else
  		render :edit
  	end	
  end

  private
  def set_article
  	@article = Article.find(params[:id])
  end

  def article_params
  	params.require(:article).permit(:title, :description, category_ids: [])
  end

  # def photo_params
  # 	params.require(:photo).permit(:image, :title)
  # end

  def require_same_user
  	if current_user.id != @article.user_id and !current_user.admin?
  		flash[:danger] = "You can only edit or delete your own posts"
  		redirect_to root_path
  	end
  end


end
