class UsersController < ApplicationController
  respond_to :html, :json
    
  before_filter :signed_in_user, 
                only: [:index, :edit, :update, :following, :followers]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
      @user = User.find params[:id]
      
      respond_to do |format|
          if @user.update_attributes(params[:user])
              format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
              format.json { respond_with_bip(@user) }
              sign_in @user
              #redirect_to @user
              else
              format.html { render :action => "edit" }
              format.json { respond_with_bip(@user) }
          end
      end
      #if @user.update_attributes(params[:user])
      #flash[:success] = "Profile updated"
      #sign_in @user
      #redirect_to @user
      #else
      #render 'edit'
      #end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end