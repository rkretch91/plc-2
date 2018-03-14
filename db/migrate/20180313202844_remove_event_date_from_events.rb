class RemoveEventDateFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :event_date, :date
    remove_column :events, :event_time_start, :time
    remove_column :events, :event_time_end, :time
  end
end
