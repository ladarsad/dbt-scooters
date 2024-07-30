/*
Задача 3. Cоздать в базе данных таблицу со средним количеством поездок в день в зависимости от возраста пользователя. Возраст надо вычислять исходя из даты рождения и даты начала поездки.
*/

with
    date_age_cte as (
        select
            date(t.started_at) as date,
            extract(year from t.started_at) - extract(year from u.birth_date) as age
        from
            scooters_raw.trips as t
            inner join scooters_raw.users as u on t.user_id = u.id
    ),
    count_cte as (
        select
            date,
            age,
            count(*) as trips
        from
            date_age_cte
        group by
            1,
            2
        )
select
    age,
    avg(trips) as avg_trips
from
    count_cte
group by
    1
order by
    1