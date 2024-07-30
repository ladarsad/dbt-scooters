/*
Задача 2. Посчитать статистику поездок по дням. Результат записать в таблицу со столбцами:
date - дата начала поездки
trips - количество поездок за день
max_price_rub - максимальная стоимость поездки за день в рублях
avg_distance_km - средняя дальность поездки за день в километрах
*/

{{ config(materialized="table") }}
select
    date(started_at) as date,
    count(*) as trips,
    max(price) / 100 as max_price_rub,
    avg(distance) / 1000 as avg_distance_km
from
    scooters_raw.trips
group by
    1
order by
    1