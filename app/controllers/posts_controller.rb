class PostsController < ApplicationController
  def index
    if @current_user 
      @posts = Post.where(user_id: @current_user.id)
    end


  end

  def new
    @post = Post.new
    @group = Group.find_by(id: params[:id])

  end

  def create
    puts "testmessage"
    puts params["post"]["content"]
    puts "testmessage"

    @group = Group.find_by(id: params[:id])

    @post = Post.new(
      content: params["post"]["content"],
      user_id: params["post"]["user_id"]
    )
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.save
    redirect_to("/posts/index")
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    
    redirect_to("/posts/index")
  end
end
