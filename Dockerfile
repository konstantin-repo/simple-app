FROM golang:1.12
WORKDIR /go/src/github.com/k14s/k8s-simple-app/
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -v -o app

FROM scratch
COPY --from=0 /go/src/github.com/k14s/k8s-simple-app/app .
EXPOSE 8080
ENTRYPOINT ["/app"]
