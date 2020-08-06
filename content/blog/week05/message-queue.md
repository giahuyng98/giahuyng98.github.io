---
title: Message queue
date: "2020-08-06T00:00:00.000Z"
description: "Message queue in microservice"
---

# Point-To-Point
- Services call direct api from other services
- Too many service -> get complicated

# Message queue
- Services communicate through `Message queue`
- Microservice `pushlish` a message of `topic` => Message queue 
- Some microservice `subscribe` some `topic` => receive a message
- Message Broker
- Async protocol: AMQP, MQTT
- Message base
- Data pipeline

# References
[https://microservices.io/patterns/microservices.html](https://microservices.io/patterns/microservices.html
