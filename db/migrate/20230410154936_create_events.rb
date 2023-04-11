class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.datetime :start_date, null: false
      t.datetime :end_date
      t.time :start_time, null: false
      t.float :duration, null: false
      t.integer :recurrence, null: false, default: 0
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
