class PostsController < ApplicationController
  def index
    if @current_user 
      @posts = Post.where(user_id: @current_user.id).where(task_done:nil) 
    end

    @group = Group.find_by(id: params[:id])
  end

  def post_hide
    @post = Post.find_by(id: params[:id])
    if @post.task_done 
        @post.task_done = nil
    else 
      @post.task_done = true
    end
    @post.save
    redirect_to action: "index"
  end

  def new
    @post = Post.new
    @group = Group.find_by(id: params[:id])

  end

  def create
    puts "testmessage"
    puts params["post"]["content"]
    puts "testmessage"
    puts params["post"]["user_id"]
    params["post"]["user_id"].each do |userid|
        puts userid.to_i
    end



    @group = Group.find_by(id: params[:id])

    params["post"]["user_id"].each do |userid|
      @post = Post.new(
        content: params["post"]["content"],
        user_id: userid.to_i
      )
      @post.save
    end
    
    flash[:notice] = "投稿を作成しました"
    redirect_to :action => "index"
    
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
