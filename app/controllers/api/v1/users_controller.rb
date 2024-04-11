class Api::V1::UsersController < ApplicationController
  before_action :authorize,  except: [:create, :login]
  # before_action :
  # GET /users
  def index
    @users = User.all

    # binding.b

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  def account
    render json: {user: @current_user}, status: :ok

  end

  # POST /us
  def create
     
    @user = User.new(user_params)

    if @user.save
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}, status: :created
    else
      render json: {error: "failed to create user"}, status: :unprocessable_entity
    end
  end

  def login
    @current_user = User.find_by(email: user_params[:email])

    if @current_user && @current_user.authenticate(user_params[:password])
      initialize_wallet
      token = encode_token({user_id: @current_user.id})
      render json: {user: @current_user, token: token}, status: :ok
    else
      render json: {error: "invalid username"}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @current.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :phone_no, :email, :role, :username, :password)
    end
end
