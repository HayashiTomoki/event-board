class Participant < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  validate :deadline_past, on: :update


#参加期限が過ぎていた時のバリデーション
  def deadline_past
    event = Event.find(event_id)
    if event.deadline < Time.now.to_s(:db)
      errors.add(:deadline_post, "回答期限をすぎています")
    end
  end
end
