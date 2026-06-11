# Генератор и аналитик данных

Два Docker-контейнера обмениваются данными через папку data на хосте.
Генератор создаёт CSV с данными об автомобилях, аналитик строит HTML-отчёт.

## Команды

```bash
chmod +x run.sh   # чтобы сделать скрипт исполняемым

./run.sh build_generator    # собрать образ генератора
./run.sh run_generator      # создать data.csv
./run.sh create_local_data  # сгенерировать данные без Docker
./run.sh build_reporter     # собрать образ аналитика
./run.sh run_reporter       # создать report.html
./run.sh structure          # структура файлов проекта
./run.sh clear_data         # удалить .csv и .html из data
./run.sh inside_generator   # содержимое data изнутри контейнера генератора
./run.sh inside_reporter    # содержимое data изнутри контейнера аналитика
```

## Автор
Гурылёв Илья Александрович ББИ2510