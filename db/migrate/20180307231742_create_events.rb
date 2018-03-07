class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :event_name
      t.text :description
      t.date :event_date
      t.time :event_time_start
      t.time :event_time_end
      t.integer :rsvp_limit

      t.timestamps
    end
  end
end
