class UsersController < ApplicationController
  def index
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    User.transaction do
      @user.save!
      @events = Event.where("date >= ?",Time.now.to_s(:db))
      @events.each do |event|
        event.participants.create!(user_id: @user.id)
      end
    end

    #例外が発生しなかった場合の処理
    redirect_to users_path

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :slack_id)
  end

end
