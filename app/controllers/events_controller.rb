class EventsController < ApplicationController
  def new
  	@event = Event.new
  end

  def create
	 @event = Event.new(event_params)
	  if @event.save
        
        #作成したイベントにuser全員を未回答で追加
        @users = User.all
        @users.each_with_index do |user|
          @event.participants.create(user_id: user.id, user_name: user.user_name)
        end

	    redirect_to events_path
	    notify_to_slack
	  else
	    # ValidationエラーなどでDBに保存できない場合 new.html.erb を再表示
	    render 'new'
	  end
  end

  def index
    from = Time.now.at_beginning_of_day
    to   = from + 1.year
    @events = Event.where(date: (from...to)).order("date")
  end

  def show
     @event = Event.find(params[:id])
     @participants = @event.participants
     @participated_users = @participants.where(status: 'participated')
     @cancelled_users = @participants.where(status: 'cancelled')
     @unanswered_users = @participants.where(status: 'unanswered')

     @comments = @event.comments 
  end

  def join
    @participants = Participant.where(user_id: params[:participant][:user_id])
    @participant = @participants.find_by(event_id: params[:event][:id])
    @participant.update(status: 'participated')
    redirect_to :back 
  end

  def cancel 
    @participants = Participant.where(user_id: params[:participant][:user_id])
    @participant = @participants.find_by(event_id: params[:event][:id])
    @participant.update(status: 'cancelled')
    redirect_to :back 
  end

  def add_comment
    @comment = Comment.new
    @comment.event_id = params[:event][:id]
    @comment.user_name = params[:comment][:user_name]
    @comment.text = params[:comment][:text]
    @comment.save
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
