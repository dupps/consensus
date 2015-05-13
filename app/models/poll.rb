class Poll < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :choices
  has_many :answers, through: :choices

  validates_presence_of :topic, :description

  accepts_nested_attributes_for :choices, :reject_if => :all_blank, :allow_destroy => true
end
