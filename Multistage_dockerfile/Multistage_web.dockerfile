#primera etapa
FROM golang as builder
WORKDIR /webtest
COPY . .
EXPOSE 80 
RUN go build -o /webtest dispatcher.go  
#COPY app ./
#RUN CGO_ENABLED=0 go build -a -installsuffix cgo -o .

#segunda etapa
FROM alpine:latest  
WORKDIR /
COPY --from=builder /webtest /webtest
CMD ["./webtest"]