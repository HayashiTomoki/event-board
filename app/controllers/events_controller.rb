class EventsController < ApplicationController
  def new
  	@event = Event.new
  end

  def create
	 @event = Event.new(event_params)
	  if @event.save
	    # @userはuser_path(@user) に自動変換される
	    redirect_to :action => "list"
	  else
	    # ValidationエラーなどでDBに保存できない場合 new.html.erb を再表示
	    render 'new'
	  end
  end

  def list
    @event = Event.all
  end

  private
  # Rails4からStrongParamaterと呼ばれる機能が追加されました。
  # セキュリティのため、permitメソッドで許可したパラメータ名しか取得できません。
  def event_params
    params.require(:event).permit(:title, :owner, :date ,:deadline ,:detail)
  end

end
