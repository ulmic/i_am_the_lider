![ILider_Logo](https://raw.github.com/ulmic/i_am_the_lider/master/logo.jpg) Сайт конкурса "Я - лидер!"

==============

[![Build Status](https://travis-ci.org/ulmic/i_am_the_lider.png?branch=master)](https://travis-ci.org/ulmic/i_am_the_lider) [![Coverage Status](https://coveralls.io/repos/ulmic/i_am_the_lider/badge.png?branch=master)](https://coveralls.io/r/ulmic/i_am_the_lider?branch=master) [![Code Climate](https://codeclimate.com/github/ulmic/i_am_the_lider.png)](https://codeclimate.com/github/ulmic/i_am_the_lider)

С помощью этого сайта участники конкурса могут выкладывать свои конкурсные проекты, отчёты о выполнении конкурсных испытаний, а также личные блоги о конкурсе и "за жизнь".

Жюри конкурса с помощью этого сервиса может оценивать по работы участников за каждый отдельный этап.

Администраторы конкурса могут размещать информацию о конкурсе, а также администрировать критерии оценки работ участников.

Подробнее о конкурсе актива учащейся молодёжи можно прочитать здесь (http://www.ulmic.ru/programms/lider/-l-r).

Сам проект расположен по адресу http://ul-lider.ru

===============

With this website, contestants can upload their competitive projects, reports on the implementation of competitive tests, as well as personal blogs about the contest and their lifes.

Read more about the contest asset of students can be found here (http://www.ulmic.ru/programms/lider/-l-r (in Russian))

http://ul-lider.ru

===============

    git clone git@github.com:ulmic/i_am_the_lider
    cd i_am_the_lider
    bundle
    rake db:migrate && RAILS_ENV=test rake db:migrate
    tconsole all
    rails s
  
