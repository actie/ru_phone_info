# RuPhoneInfo

Гем обертка для [Выписки из реестра Российской системы и плана нумерации](ttp://rossvyaz.ru/activity/num_resurs/registerNum/)

Возвращает регион и оператора по номеру мобильного телефона

Актуально по состоянию на 19.05.2016


## Установка

Добавьте в Gemfile:

```ruby
gem 'ru_phone_info', github: "actie/ru_phone_info"
```

запустите:

    $ bundle


## Использование

```ruby
require "ru_phone_info"

RuPhoneInfo.get('+7 (909) 444 45 13')
RuPhoneInfo.get('+79094444513')
RuPhoneInfo.get('89094444513')


{
    :code=>"909", 
    :begin=>"4430000", 
    :end=>"4689999",
    :capacity=>"260000", 
    :operator=>"ОАО Вымпел-Коммуникации", 
    :region=>"Краснодарский край"
 }

```


## License

[MIT](http://opensource.org/licenses/MIT).

