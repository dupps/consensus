class Poll < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :choices
  has_many :answers, through: :choices

  validates_presence_of :topic, :description, :choices

  accepts_nested_attributes_for :choices, :reject_if => :all_blank, :allow_destroy => true

  # def normalized_votes_for(choice)
  #   votes_summary == 0 ? 0 : (choice.votes.count.to_f / votes_summary) * 100
  # end
  #
  # def votes_summary
  #   choices.inject(0) {|summary, choice| summary + choice.votes.count}
  # end
end
