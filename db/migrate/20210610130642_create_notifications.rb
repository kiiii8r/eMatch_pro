class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|

      t.references :user, foreign_key: true
      t.integer :visiter
      t.references :relationship, foreign_key: true
      t.references :message, foreign_key: true

      t.timestamps
    end
  end
end
