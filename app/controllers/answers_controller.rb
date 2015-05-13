class AnswersController < ApplicationController
  def create
    if current_user && params[:poll] && params[:poll][:id] && params[:choice] && params[:choice][:id]
      @poll = Poll.find_by_id(params[:poll][:id])
      @choice = @poll.choices.find_by_id(params[:choice][:id])
      if @choice && @poll && !current_user.answered_for?(@poll)
        @choice.answers.create({user_id: current_user.id})
      else
        render js: 'alert(\'Your answer cannot be saved. Have you already answered?\');'
      end
    else
      render js: 'alert(\'Your answer cannot be saved.\');'
    end
  end
end