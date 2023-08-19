class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :text
      t.text :image
      t.timestamps
    end
  end
end