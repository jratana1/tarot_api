class CreateReadings < ActiveRecord::Migration[6.0]
  def change
    create_table :readings do |t|
      t.integer :user_id
      t.string :question
      t.text :notes

      t.timestamps
    end
  end
end
