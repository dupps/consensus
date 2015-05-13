class Choice < ActiveRecord::Base
  belongs_to :poll
  has_many :users, through: :answers
  has_many :answers, dependent: :destroy
end
