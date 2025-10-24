FROM golang

WORKDIR /app

COPY go.mod ./
RUN go mod tidy

COPY . .

RUN go build -o server .

EXPOSE 8080
CMD ["./server"]