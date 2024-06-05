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
- обеспечить линейный рост пользовательской базы до примерно 10 000 000 уникальных пользователей в день через год, после чего также будет продолжать расти.
- учесть ориентацию бизнеса пока только на аудиторию стран СНГ
- обеспечить систему высокой надежностью
- спроектировать удобные интерфейсы для взаимодействия с системой, в том числе через мобильные устройства и браузер
- формализовать функциональные и нефункциональные требования, используя полученную информацию от бизнеса, анализ конкурентов и инженерный опыт
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
- Поведение пользователей: один пользователь, в среднем, будет делать 12 запросов в день к приложению
- Регионы использования приложения: аудитория стран СНГ
- Сезонности в приложении: сезоны осенних и предновогодних распродаж
- Условия хранения данных: хранить всегда
- Лимиты и ограничения: 1 000 000 подписчиков у пользователя
- Временные ограничения: время ответа не более, чем 5 секунд
- Доступность приложения: не более, чем несколько часов простоя в год

### 📈 Оценка нагрузки:
Допустим следующие данные:

    Количество пользователей: 10 000 000 DAU
    Количество действий каждого пользователя в день:
        Публикации: 1 пост
        Комментарии: 1 комментарий
        Просмотры ленты: 10 запросов

Вычислим следующие показатели:

    10 000 000 пользователей * 1 пост = 10 000 000 постов
    10 000 000 пользователей * 1 комментарий = 10 000 000 комментариев
    10 000 000 пользователей * 10 запросов = 100 000 000 запросов
    Расчет RPS: Общее количество действий в день / количество секунд за день = 120 000 000 / 86400 ~ 1389 rps
    Расчет графика (запрос 2 КБ): Traffic = RPS * avg_request_size Traffic = 1389 * 2048 Байт Traffic ~ 2844445 Байт/с (или ~ 2.7 МБ/с)
    Расчет одновременных соединений: обычно 10% от общего DAU, то есть: 10 000 000 * 0.1 = 1 000 000

