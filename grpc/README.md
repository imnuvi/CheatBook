gRPC (grpc Remote Procedural Call)

in grpc a client application can directly call a method on server application which is on a different machine as if it were a local object. 

Server side:
  implements the interface and runs a grpc server to handle client calls. 

Client side:
  has a stub that provides the same methods as the server

the client side makes the call with the same parameters and return types


advantages of using grpc over rest:
  - its faster than rest api calls
  - the grpc server and the grpc stub can be in any grpc supported languages. 
  - the data structure is already known by the server and the client making it faster to serialize and deserialize rather than parsing a json and then enumerating its fields
  - uses http/2 so its pretty fast

## Protocol buffers
  Protocol buffers offer a platform netural and language neutral mechanism for serializing structured data which is both forward and backward compatible. Just like json but faster
  Protocol buffer messages and services are stored in .proto files.

  sample proto buffer
  <code>message Person {
    optional string name = 1;
    optional int32 id = 2;
    optional string email = 3;
  }</code>

  A compiler is invoked at build time to convert the proto file into language specific code to manipulate the proto buff
