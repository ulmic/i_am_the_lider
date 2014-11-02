district_titles = [
                             'г. Ульяновск' 		,
                             'г. Димитровград' 		,
                             'г. Новоульяновск' 	,
                             'г. Димитровград' 		,
                             'Базарносызганский район' 	,
			                 'Барышский район' 		,
                             'Вешкаймский район' 	,
                             'Инзенский район' 		,
                             'Карсунский район' 	,
                             'Кузоватовский район' 	,
                             'Майнский район' 		,
                             'Мелекесский район' 	,
                             'Николаевский район' 	,
                             'Новомалыклинский район' 	,
                             'Новоспасский район' 	,
                             'Павловский район' 	,
                             'Радищевский район' 	,
                             'Сенгилеевский район' 	,
                             'Старокулаткинский район' 	,
                             'Старомайнский район' 	,
                             'Сурский район' 		,
                             'Тереньгульский район'	,
                             'Ульяновский район' 	,
                             'Цильнинский район' 	,
                             'Чердаклинский район'
                            ]

district_titles.each do |title|
  District.find_or_create_by_title title
end

stages_titles = [
                  'Время быть лидером',
                  'Ярмарка идей',
                  'Время реальных дел',
                  'Финал'
]

stages_titles.each do |title|
  Stage.find_or_create_by_title title
end
stage = Stage.find_by_title(stages_titles[0])
stage.begin_date = "Fri, 20 Dec 2013 00:00:00 +0400"
stage.end_date = "Fri, 20 Jan 2013 00:00:00 +0400"
stage.save
stage = Stage.find_by_title(stages_titles[1])
stage.begin_date = "Fri, 20 Feb 2013 00:00:00 +0400"
stage.end_date = "Fri, 25 Feb 2013 00:00:00 +0400"
stage.save
stage = Stage.find_by_title(stages_titles[2])
stage.begin_date = "Fri, 1 Mar 2013 00:00:00 +0400"
stage.end_date = "Fri, 20 May 2013 00:00:00 +0400"
stage.save
stage = Stage.find_by_title(stages_titles[3])
stage.begin_date = "Fri, 30 Jun 2013 00:00:00 +0400"
stage.end_date = "Fri, 30 Jun 2013 23:59:59 +0400"
stage.save
