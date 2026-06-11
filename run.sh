#!/usr/bin/env bash
set -e

COMMAND="$1"

case "$COMMAND" in
    build_generator)
        docker build -t generator ./generator
        ;;

    run_generator)
        docker run --rm -v "$(pwd)/data:/data" generator
        ;;

    create_local_data)
        python3 generator/generate.py local_data
        ;;
    
    build_reporter)
        docker build -t reporter ./reporter
        ;;

    run_reporter)
        docker run --rm -v "$(pwd)/data:/data" reporter
        ;;

    structure)
        find . -not -path './.git/*'
        ;;

    clear_data)
        rm -f data/*.csv data/*.html
        echo "Папка data очищена"
        ;;

    inside_generator)
        docker run --rm -v "$(pwd)/data:/data" generator ls -la /data
        ;;

    inside_reporter)
        docker run --rm -v "$(pwd)/data:/data" reporter ls -la /data
        ;;

    *)
        echo "Неизвестная команда: $COMMAND"
        echo "Доступные команды: build_generator, run_generator, create_local_data"
        ;;
esac