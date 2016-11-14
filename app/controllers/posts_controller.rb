class PostsController < ApplicationController
  http_basic_authenticate_with name: "killa", password: "nevergonnaguess", except: [:index, :show]

  before_action :find_post, only: [:edit, :update, :show, :destroy]

  def index 
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      @errors = @post.errors.full_messages
      render :new
    end
  end 

  def show
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to @post
    end
  end



  private

  def post_params
    params.require(:post).permit :title, :body
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
