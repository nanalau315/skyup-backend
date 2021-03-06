class CreateCommentreports < ActiveRecord::Migration[6.1]
  def change
    create_table :commentreports do |t|
      t.integer :comment_id
      t.integer :user_id
      t.string :reason

      t.timestamps
    end
  end
end
