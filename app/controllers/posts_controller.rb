class PostsController < ApplicationController
  def index
      #debugger
      term = params[:post_name]
      #@posts = Post.all.paginate(page: params[:page], per_page: 3)
      @posts = Post.where("UPPER(title) like UPPER(?)", "%#{term}%").paginate(page: params[:page], per_page: 10)
      #debugger
  end


  def new
      @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if (@post.update(post_params))
      redirect_to @post
    else
      render 'new'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
  end

  def create
    #render plain: params[:post].inspect
    @post = Post.new(post_params)
    #save post
    @post.save
    #link to show
    redirect_to @post
  end

private def post_params

  params.require(:post).permit(:title, :body, :category_id)

end

end
