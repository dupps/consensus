class CreateJoinTablePollUser < ActiveRecord::Migration
  def change
    create_join_table :polls, :users do |t|
      # t.index [:poll_id, :user_id]
      # t.index [:user_id, :poll_id]
    end
  end
end
