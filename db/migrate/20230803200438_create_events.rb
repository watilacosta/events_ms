class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.datetime :event_datetime
      t.integer :event_type
      t.decimal :registration_fee
      t.integer :capacity
      t.integer :status
      t.string :organizer_id

      t.timestamps
    end
  end
end
