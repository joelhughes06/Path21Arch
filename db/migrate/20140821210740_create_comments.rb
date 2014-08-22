class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.string :commentator
    	t.string :email
    	t.string :ip
    	t.timestamps
    	t.integer :post_id
    	t.text :comment
    end
  end
end
