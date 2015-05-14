class AnswersController < ApplicationController
  def create
    choice = Choice.find(params[:choice][:id])
    Answer.create user: current_user, choice: choice
    redirect_to poll_path choice.poll, hide_already_answered: true
  end
end