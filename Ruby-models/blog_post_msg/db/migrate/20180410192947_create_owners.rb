class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.references :users, index: true, foreign_key: true
      t.references :blogs, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
