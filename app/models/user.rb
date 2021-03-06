class User < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_many :choices, through: :answers
  has_and_belongs_to_many :polls

  validates_presence_of :email
  validates_uniqueness_of :email

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def answered_for?(poll)
    answers.any? {|v| v.choice.poll == poll}
  end
end
