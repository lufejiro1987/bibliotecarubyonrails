class CreateBookActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :book_activities do |t|
      t.references :book, null: false, foreign_key: true
      t.date :date
      t.string :activity

      t.timestamps
    end
  end
end
