class GroupsController < ApplicationController
  def index
    @groups = Group.all
  	#@groups = Group.users.where(user_id: @current_user.id)
    #@groups = Group.where(user_id: @current_user.id)
    
  end

  def new
  	@group = Group.new 
  end

  def create
  	@group = Group.new(
      name: params[:name]
    )
    @current_user == @group.owner
    if @group.save
      flash[:notice] = "グループを作成しました"
      redirect_to("/groups/index")
    else
      render("groups/new")
    end
  end

  def show
    @group = Group.find_by(id: params[:id])
  end

  
end
