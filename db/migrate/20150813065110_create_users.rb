class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :username_lower
      t.inet :ip_address
      t.inet :registration_ip_address
      t.string :locale
      t.string :password_digest
      t.string :auth_token
      t.boolean :admin
      t.boolean :approved
      t.datetime :approved_at
      t.boolean :admin
      t.boolean :blocked

      t.timestamps null: false
    end
  end
end
