class GroupsController < ApplicationController
  

  def new
  	@group = Group.new 
  end

  def create
    puts "test"
    puts params["group"]["name"]
    puts "test"

  	@group = Group.new(
      name: params["group"]["name"]
    )

    puts @group.name.class
    #puts params["group"]["name"]

#    @current_user == @group.owner
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

  def index
    @groups = Group.all
    #@groups = Group.users.where(user_id: @current_user.id)
    #@groups = Group.where(user_id: @current_user.id)
    
  end

  def join
    @group_user = GroupUser.new(
      group_id: params["group"]["id"],
      user_id: @current_user.id
    )
    puts params["group"]["id"]
    puts @group_user.group_id

    if @group_user.save
      flash[:notice] = "グループに参加しました"
      redirect_to("/groups/index")
    else
      render("groups/#{group.id}")
    end
  end

  
end
