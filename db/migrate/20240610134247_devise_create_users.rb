# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ''
      t.string :encrypted_password, null: false, default: ''
      t.string :given_name
      t.string :family_name

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end
