class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update, :index]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user_edit, only: [:edit, :update]
  before_action :admin_user_destroy, only: [:destroy]
  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(page: params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Check your email to activate your account."
      redirect_to(root_url)
    else
        render 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.


    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    # Before filters
    def set_user
      @user = User.find(params[:id])
    end
    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    def correct_user_edit
      @user = User.find(params[:id])
      unless @user == current_user
        flash[:danger] = "You do not have permission to edit this profile."
        redirect_to users_url
      end
    end
    def admin_user_destroy
      @user = User.find(params[:id])
      unless current_user.admin?
        flash[:danger] = "You do not have permission to delete this user."
        redirect_to users_url
      end
    end
end
