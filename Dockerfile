FROM alpine:latest
RUN apk update && \
    apk add --no-cache gcc g++ make musl-dev libgomp
COPY . /PARVPO_lab1
WORKDIR /PARVPO_lab1
RUN gcc -fopenmp -o main main.c
CMD ["./main"]


FROM alpine:latest
RUN apk update && \
    apk add --no-cache g++ git
WORKDIR /app
COPY main.cpp .
RUN g++ -o myprogram main.cpp
RUN ./myprogram > /app/output.txt
