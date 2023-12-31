class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.references :user,             null: false, foreign_key: true
      t.string :place,                null: false
      t.text :work,                   null: false
      t.string :start_time,             null: false
      t.string :ending_time,            null: false
      t.integer :category_id,         null: false

      t.timestamps
    end
  end
end
