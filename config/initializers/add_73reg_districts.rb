module NewLookContestReg
  class Application < Rails::Railtie
    config.after_initialize do
      if District.all.empty?
        District.new(:title => "г. Ульяновск").save
        District.new(:title => "г. Димитровград").save
        District.new(:title => "г. Новоульяновск").save
        District.new(:title => "Базарносызганский район").save
        District.new(:title => "Барышский район").save
        District.new(:title => "Вешкаймский район").save
        District.new(:title => "Инзенский район").save
        District.new(:title => "Карсунский район").save
        District.new(:title => "Кузоватовский район").save
        District.new(:title => "Майнский район").save
        District.new(:title => "Мелекесский район").save
        District.new(:title => "Николаевский район").save
        District.new(:title => "Новомалыклинский район").save
        District.new(:title => "Новоспасский район").save
        District.new(:title => "Павловский район").save
        District.new(:title => "Радищевский район").save
        District.new(:title => "Сенгилеевский район").save
        District.new(:title => "Старокулаткинский район").save
        District.new(:title => "Старомайнский район").save
        District.new(:title => "Сурский район").save
        District.new(:title => "Теренгульский район").save
        District.new(:title => "Ульяновский район").save
        District.new(:title => "Цильнинский район").save
        District.new(:title => "Чердаклинский район").save
      end
    end
  end
end 
