Kafka is an event streaming platform with pub sub architecture
Producers generate events and consumers recieve subscribed events
each event will have a key, value and timestamp
a topic is a category to which partitioned logs are written. 
Kafka maintains the partitioned logs and maintaines replicated since its a distributed system

## Producers

Producers publish data to topics of choice. it is responsible for choosing which record to assign to which partition.

## Consumers 

consumer groups can subscribe to one or more topics


every message in a topic is delivered to one of these customers within a customer group. all messages with same key arrive at the same consumer
