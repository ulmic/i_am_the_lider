class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :district_id
      t.date :birth_date
      t.text :school
      t.text :group
      t.string :mobile_phone
      t.string :home_phone
      t.text :email
      t.text :vkontakte
      t.text :twitter

      t.timestamps
    end
  end
end
