class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.attachment :image
      t.references :article, index: true

      t.timestamps
    end
  end
end
