Configus.build :development do
  env :production do
    end_reg_time '2014-02-10 00:00:00'
  end
  env :development, parent: :production
  env :test, parent: :development
end
