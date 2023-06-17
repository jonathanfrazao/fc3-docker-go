FROM golang:1.17.0-alpine AS build

WORKDIR /go/src/app
COPY . .

RUN go mod init
RUN go build -o fullcycle .

FROM scratch

WORKDIR /go/src/app
COPY --from=build /go/src/app/fullcycle .

CMD ["./fullcycle"]