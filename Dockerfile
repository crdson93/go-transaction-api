FROM golang

WORKDIR /app

COPY go.mod .

RUN go mod tidy

COPY *.go .

RUN CGO_ENABLED=0 GOOS=linux go build -o /opt/transaction-api

FROM alpine:latest

COPY --from=builder /opt/transaction-api /opt/transaction-api

EXPOSE 8080
ENTRYPOINT [ "/opt/transaction-api" ]