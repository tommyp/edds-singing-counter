class CreateClocks < ActiveRecord::Migration
  def change
    create_table :clocks do |t|
      t.datetime :end_time

      t.timestamps
    end
  end
end
