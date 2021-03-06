class CreatePostreports < ActiveRecord::Migration[6.1]
  def change
    create_table :postreports do |t|
      t.integer :post_id
      t.integer :user_id
      t.string :reason

      t.timestamps
    end
  end
end
