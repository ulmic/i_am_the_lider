FactoryGirl.define do
  sequence :string, aliases: [:postcode, :address_info, :city, :country, :province, :state,  :body, :title, :name, :slug, :description, :short_description, :manufacturer, :currency, :product_name, :package_name, :first_name, :last_name, :shipping_method, :payment_method] do |n|
    "string-#{n}"
  end

  sequence :email do |n|
    "email#{n}@test.ru"
  end

  sequence :password do |n|
    "#{n}pass_word#{n}"
  end

  sequence :site, aliases: [:shop_site] do |n|
    "http://site-#{n}.com"
  end

  sequence :integer, aliases: [:position, :group, :order, :custom_flavor_position, :weight, :quantity] do |n|
    n
  end

  sequence :true, aliases: [:newsletter,:gift_receipt, :gift_wrap] do |n|
    true
  end

  sequence :price, aliases: [:package_cost, :amount, :total, :subtotal, :delivery] do |n|
    "#{n}"
  end

  sequence :phone do |n|
    (17001000600+n).to_s
  end
end
