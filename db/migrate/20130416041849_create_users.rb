class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :district_id
      t.date :birth_date
      t.string :school
      t.string :group
      t.string :mobile_phone
      t.string :home_phone
      t.string :email
      t.string :vkontakte
      t.string :twitter

      t.timestamps
    end
  end
end
