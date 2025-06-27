class CreateClassrooms < ActiveRecord::Migration[7.1]
  def change
    create_table :classrooms do |t|
      t.integer :grade
      t.integer :shift
      t.string :code
      t.integer :year

      t.timestamps
    end
  end
end
