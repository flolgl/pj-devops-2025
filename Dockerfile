FROM golang:1.21

WORKDIR /app

COPY ./webapi .

RUN go build -o main .

EXPOSE 8080

CMD ["./main"]