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

    *)
        echo "Неизвестная команда: $COMMAND"
        echo "Доступные команды: build_generator, run_generator, create_local_data"
        ;;
esac