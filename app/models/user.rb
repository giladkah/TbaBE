class User < ActiveRecord::Base

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  #validates :phone_number, presence: true, length: { maximum: 50 }
  #validates :address, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  before_save { self.email = email.downcase }

  has_many :messages
  #has_secure_password
  #validates :password, presence: true, length: { minimum: 6 }

  def update_messages(messages)
    return unless messages
    messages.each do |message|
      next if self.messages.contain(message.id)
      self.messages.build(message)
    end
  end

  def spam_messages
    #self.messages.select { |message| message.is_spam? }
    self.messages
  end

end
