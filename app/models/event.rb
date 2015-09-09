class Event < ActiveRecord::Base
  has_many :participants
  validates :title, presence: true
  validates :owner, presence: true
  validate :expiration_date_cannot_be_in_the_past, :reverse_date_and_deadline, :over_one_year_date

#開催日または参加期限は登録日以降になっているかの確認
  def expiration_date_cannot_be_in_the_past
    if date.present? && date < Date.today && deadline.present? && deadline < Date.today
      errors.add(:date_expiration, "開催日または参加期限は本日以降にしてください")
    end
  end

#参加期限と開催日が逆転していないかの確認
  def reverse_date_and_deadline
    if date < deadline
      errors.add(:date_reverse ,"参加期限が開催日以降になっています")
    end
  end

#開催日が1年以内になっているかの確認
  def over_one_year_date
    if date > (Date.today + 1.year)
      errors.add(:date_over ,"開催日は本日から１年以内に設定してください")
    end
  end
end
