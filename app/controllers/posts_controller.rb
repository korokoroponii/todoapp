class PostsController < ApplicationController
  before_action :check_admin_user
  
  def check_admin_user
    @group = Group.find_by(id: params[:group_id])
    if @current_user.id == @group.created_by
      @admin = true
    end
  end  

  def index
    if @current_user 
      if @admin
        @posts = Post.where(group_id: @group.id) 
      else
        @posts = Post.where(user_id: @current_user.id).where(task_done:nil) 
      end
    end

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
    puts params["group_id"]
    puts params["post"]["content"]
    puts "testmessage"
    puts params["post"]["user_id"]
    params["post"]["user_id"].each do |userid|
        puts userid.to_i
    end



    params["post"]["user_id"].each do |userid|
      puts userid
      puts"-------------------"
      @post = Post.new(
        content: params["post"]["content"],
        user_id: userid.to_i,
        group_id: params["group_id"],
      )
      @post.save
      logger.debug @post.errors.inspect
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
