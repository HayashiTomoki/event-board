class Event < ActiveRecord::Base
  has_many :participants
  validates :title, presence: true
  validates :owner, presence: true
  validate :expiration_date_cannot_be_in_the_past, :reverse_date_and_deadline
            

  def expiration_date_cannot_be_in_the_past
    if date.present? && date < Date.today && deadline.present? && deadline < Date.today
      errors.add(:date_expiration, "開催日または参加期限は今日以降にしてください")
    end
  end

  def reverse_date_and_deadline
    if date < deadline
      errors.add(:date_reverse ,"参加期限が開催日以降になっています")
    end
  end
end
