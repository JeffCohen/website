class Events < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :msg
    end
  end
end
