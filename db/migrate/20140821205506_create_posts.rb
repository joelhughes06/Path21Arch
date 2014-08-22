class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :title
    	t.text :description
    	t.timestamps
    	t.string :author
    	t.string :email
    	t.string :ip
    	t.binary :image
    end
  end
end
