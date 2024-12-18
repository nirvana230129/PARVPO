FROM alpine:latest
RUN apk update && \
    apk add --no-cache build-base git gcc libgomp
WORKDIR /app
RUN git clone https://github.com/nirvana230129/PARVPO.git .
RUN gcc -fopenmp -o lab1 main.c
RUN ./lab1 > /app/output.txt

# Копируем результат на хост-машину
# Этот шаг выполняется вне Dockerfile, так как Dockerfile не может напрямую копировать файлы на хост-машину
# Вместо этого, используйте команду docker cp после запуска контейнера
