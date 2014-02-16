Configus.build Rails.env do
  env :production do
    end_reg_time '2014-02-13 00:00:00'

    market_dreams do
      apply_part "http://www.ulmic.ru/programms/lider/3040--2014"
      end_reg_time '2014-02-16 00:00:00'
    end

    apps do
      chrome_web_store_url "https://chrome.google.com/webstore/detail/%D1%8F-%D0%BB%D0%B8%D0%B4%D0%B5%D1%80/lehbmnengpcoaledhaodhjcmibleffmd/"
    end
  end
  env :development, parent: :production
  env :test, parent: :development
end
