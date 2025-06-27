class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :role
      t.date :birthdate
      t.string :registration_number
      t.integer :preferred_shift
      t.references :classroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
