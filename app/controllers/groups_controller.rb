class GroupsController < ApplicationController
  def index
    #@groups = Group.all
  	#@groups = Group.group_users.where(user_id: @current_user.id)
    @groups = @current_user.groups
  end

  def new
  	@group = Group.new
  end

  def create
  	@group = Group.new(
      name: params[:name]
    )
    if @group.save
      flash[:notice] = "グループを作成しました"
      redirect_to("/groups/index")
    else
      render("groups/new")
    end
  end

  
end
