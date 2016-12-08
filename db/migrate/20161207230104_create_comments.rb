class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.text :content
      t.references :commentable
      t.string :commentable_type

      t.timestamps null: false
    end
  end
end
