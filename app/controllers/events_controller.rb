class EventsController < ApplicationController
  def new
  	@event = Event.new
  end

  def create
	 @event = Event.new(event_params)
	  if @event.save
	    redirect_to events_path
	    notify_to_slack
	  else
	    # ValidationエラーなどでDBに保存できない場合 new.html.erb を再表示
	    render 'new'
	  end
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @participants = @event.participants
  end

  def join
   @participant = Participant.new
   @participant.event_id = params[:event][:id]
   @participant.user_name = params[:participant][:name]
   @participant.status = 'participated' 
   @participant.save
   redirect_to :back 
  end

  # Rails4からStrongParamaterと呼ばれる機能が追加されました。
  # セキュリティのため、permitメソッドで許可したパラメータ名しか取得できません。
  private
  def event_params
    params.require(:event).permit(:title, :owner, :date ,:deadline ,:detail)
  end

  private
  def notify_to_slack
  text = <<-EOC
  --------------------------------------------
  新しいイベントが作成されました。
  --------------------------------------------

  タイトル：#{@event.title}

  開催日時：#{@event.date}

  参加期限：#{@event.deadline}

  詳細ページ：http://localhost:3000#{event_path(@event)}

  EOC

  Slack.chat_postMessage text: text, username: "イベント通知bot", channel: "#general"
  end

end
