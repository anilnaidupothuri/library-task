# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  def show
    render json: @user
  end

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.create(user_params)

    if @user.save
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    @user.update(user_params)
    render json: @user
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def user_params
    params.permit(:name, :email, :password, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
