class Poll < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :choices
  has_many :answers, through: :choices
end
