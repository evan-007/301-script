class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :new
      t.string :old

      t.timestamps
    end
  end
end
