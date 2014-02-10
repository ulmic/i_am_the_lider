Configus.build Rails.env do
  env :production do
    end_reg_time '2014-02-11 00:00:00'
    apply_part_in_market_dream_url "http://www.ulmic.ru/programms/lider/3040--2014"
  end
  env :development, parent: :production
  env :test, parent: :development
end
