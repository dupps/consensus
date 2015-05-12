class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :topic
      t.text :description
      t.datetime :expires
      t.boolean :active
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
