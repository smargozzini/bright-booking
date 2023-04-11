class CreateOverrides < ActiveRecord::Migration[7.0]
  def change
    create_table :overrides do |t|
      t.references :event, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.datetime :start_date, null: false
      t.time :start_time, null: false
      t.float :duration, null: false
      t.timestamps
    end
  end
end
