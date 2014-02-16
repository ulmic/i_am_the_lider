Configus.build Rails.env do
  env :production do
    end_reg_time '2014-02-13 00:00:00'
    market_dreams do
      apply_part "http://www.ulmic.ru/programms/lider/3040--2014"
      end_reg_time '2014-02-16 00:00:00'
    end
  end
  env :development, parent: :production
  env :test, parent: :development
end
