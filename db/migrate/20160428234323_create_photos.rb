class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      # t.string :_content_type
      t.references :user, index: true
      t.timestamps
    end
  end
end
