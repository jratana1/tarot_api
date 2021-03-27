class Api::V1::UsersController < ApplicationController
  # skip_before_action :authorized, only: [:create]

  def index
    users = User.all
    render json: UserSerializer.new(users)
  end

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
   

      @user = User.find_by(username: user_params[:username])
      if @user
        #User#authenticate comes from BCrypt
        if @user && @user.authenticate(user_params[:password])
          # encode token comes from ApplicationController
          token = encode_token({ user_id: @user.id })
          render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
        else
          render json: { message: 'Invalid username or password' }, status: :unauthorized
        end
      else
        @user = User.create(user_params)
        if @user.valid?
          @token = encode_token({ user_id: @user.id })
          render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
      end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end 