class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.string :email
      t.string :password
      t.string :postal_code
      t.string :address
      t.boolean :is_deleted
      t.string :telephone_number

      t.timestamps
    end
  end
end
