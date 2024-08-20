class BlogPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_by_id, except: [:index, :new, :create] 
  def index
    @blog_list = BlogPost.all
  end
  def show
  end
  def new
    @blog_post = BlogPost.new
  end
  def create 
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      # redirect_to @blog_post
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  def destroy
    @blog_post.destroy
    redirect_to root_path, status: :see_other
  end

  def edit
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post
    else
      render :edit, status: :unprocessable_entity
    end
  end
  private 
  def blog_post_params
    params.require(:blog_post).permit(:title, :body)
  end
  
  def find_by_id
    @blog_post = BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound #handle record not found
    redirect_to root_path
  end

end
