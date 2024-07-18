System Design социальной сети для курса по System Design 👨‍💻

## ✈️ [Go Travel](https://github.com/kodsurfer/social_network_system_design)

### 😎 Бизнес-модель:

- публикация постов из путешествий с фотографиями, небольшим описанием и привязкой к конкретному месту путешествия
- оценка и комментарии постов других путешественников
- подписка на других путешественников, чтобы следить за их активностью
- поиск популярных мест для путешествий и просмотр постов с этих мест в виде ТОПа мест по странам и городам
- общение с другими путешественниками в личных сообщениях
- просмотр ленты других путешественников

### 📜 Задачи:

- обеспечить линейный рост пользовательской базы до примерно 10 000 000 уникальных пользователей в день через год, после
  чего также будет продолжать расти.
- учесть ориентацию бизнеса пока только на аудиторию стран СНГ
- обеспечить систему высокой надежностью
- спроектировать удобные интерфейсы для взаимодействия с системой, в том числе через мобильные устройства и браузер
- формализовать функциональные и нефункциональные требования, используя полученную информацию от бизнеса, анализ
  конкурентов и инженерный опыт
- оценить нагрузку на социальную сеть

### 📕 Функциональные требования:

- просмотр ленты постов френдлиста
- создание поста с фото/видео, текстом и аудио треками
- добавление геометки к посту
- комментарии к посту
- лайки к посту и комментариям
- поиск по тегам

### 📗 Нефункциональные требования:

- Количество пользователей: 10 000 000 DAU
- Поведение пользователей: один пользователь, в среднем, будет делать 13 запросов в день (1 пост, 1 комментарий, 1
  сообщение / запросы на запись, просмотры ленты: 10 запросов на чтение)
- Регионы использования приложения: аудитория стран СНГ
- Сезонности в приложении: сезоны летних отпусков и новогодних праздников. В высокий сезон 40 запросов в день (2 поста,
  5 комментариев, 3 сообщения / запросы на запись, просмотры ленты: 20 запросов на чтение)
- Условия хранения данных: хранить всегда
- Лимиты и ограничения: 1 000 000 подписчиков у пользователя
- Временные ограничения: время ответа сервера на запрос чтения не более 1 сек, на запрос записи не более 5 сек
- Доступность приложения: не более, чем несколько часов простоя в год

### 📈 Оценка нагрузки:

Допустим следующие данные:

    Количество пользователей: 10 000 000 DAU
    Количество действий каждого пользователя в день:
        Публикации: 1 пост
        Комментарии: 1 комментарий
        Просмотры ленты: 10 запросов

Вычислим следующие показатели:

    - Обычный сезон:
        10 000 000 пользователей * 1 пост = 10 000 000 постов
        Расчет RPS сервиса постов: Общее количество в день / количество секунд за день = 10 000 000 / 86400 ~ 116 rps

        10 000 000 пользователей * 1 комментарий = 10 000 000 комментариев
        Расчет RPS сервиса комментариев: 10 000 000 / 86400 ~ 116 rps
        
        10 000 000 пользователей * 1 сообщений = 10 000 000 сообщений
        Расчет RPS сервиса сообщений: 10 000 000 / 86400 ~ 116 rps

        Расчет RPS запросов записи: 30 000 000 / 86400 ~ 348 rps
        Расчет трафика записи (запрос 2 КБ): Traffic = RPS * avg_request_size Traffic = 348 * 2048 Байт Traffic ~ 712704 Байт/с (или ~ 0.7 МБ/с)

        10 000 000 пользователей * 10 запросов = 100 000 000 запросов чтения
        Расчет RPS сервиса запросов чтения: 100 000 000 / 86400 ~ 1158 rps
        Расчет трафика записи (запрос 1 КБ): Traffic = RPS * avg_request_size Traffic = 1158 * 1024 Байт Traffic ~ 1185792 Байт/с (или ~ 1.2 МБ/с)

        Расчет одновременных соединений: обычно 10% от общего DAU, то есть: 10 000 000 * 0.1 = 1 000 000
    
    - Высокий сезон:
        10 000 000 пользователей * 2 пост = 20 000 000 постов
        Расчет RPS сервиса постов: 20 000 000 / 86400 ~ 232 rps

        10 000 000 пользователей * 5 комментарий = 50 000 000 комментариев
        Расчет RPS сервиса комментариев: 50 000 000 / 86400 ~ 579 rps
        
        10 000 000 пользователей * 3 сообщений = 30 000 000 сообщений
        Расчет RPS сервиса сообщений: 30 000 000 / 86400 ~ 348 rps

        Расчет RPS запросов записи: 100 000 000 / 86400 ~ 1158 rps
        Расчет трафика записи (запрос 2 КБ): Traffic = RPS * avg_request_size Traffic = 1158 * 2048 Байт Traffic ~ 2371584 Байт/с (или ~ 2.3 МБ/с)

        10 000 000 пользователей * 20 запросов = 200 000 000 запросов чтения
        Расчет RPS сервиса запросов чтения: 200 000 000 / 86400 ~ 2315 rps
        Расчет трафика записи (запрос 1 КБ): Traffic = RPS * avg_request_size Traffic = 2315 * 1024 Байт Traffic ~ 2370560 Байт/с (или ~ 2.3 МБ/с)

        Расчет одновременных соединений: обычно 10% от общего DAU, то есть: 10 000 000 * 0.1 = 1 000 000
    

Диски:

        1 пост = 4 КБ
        10 000 000 постов в день
        Расчет трафика постов в секунду: 4 КБ * 10 000 000 / 86400 ~ 0.5 МБ/с
        Расчет трафика постов в год: 4 КБ * 10 000 000 * 365 ~ 13.6 ПБ/год
        SSD (Sata): 13.6 ПБ / 100 ГБ ~ 140 дисков

        1 комментарий = 500 байт
        10 000 000 комментариев в день
        Расчет трафика комментариев в секунду: 500 Б * 10 000 000 / 86400 ~ 56.5 КБ/с
        Расчет трафика комментариев в год: 500 Б * 10 000 000 * 365 ~ 1.7 ПБ/год
        SSD (Sata): 1.7 ПБ / 100 ГБ ~ 17 дисков

        1 сообщение = 500 байт
        10 000 000 сообщений в день
        Расчет трафика сообщений в секунду: 500 Б * 10 000 000 / 86400 ~ 56.5 КБ/с
        Расчет трафика сообщений в год: 500 Б * 10 000 000 * 365 ~ 1.7 ПБ/год
        SSD (Sata): 1.7 ПБ / 100 ГБ ~ 17 дисков

        IOPS: 1158 rps (запись) + 2315 rps (чтение) = 3473
        Диски IOPS: 3473 / 500 ~ 7
