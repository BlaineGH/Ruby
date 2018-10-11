class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :author
      t.text :message
      t.references :posts, index: true, foreign_key: true
      t.references :users, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
