class Message < ActiveRecord::Base

  validates :sent_at, presence: true
  validates :from, presence: true
  validates :to, presence: true
  validates :body, presence: true
  validates :status, presence: true
  belongs_to :user


  def is_spam?
    status == 'spam'
  end

end
