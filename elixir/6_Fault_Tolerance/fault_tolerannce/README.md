# FaultTolerannce

The way Elixir approaches fault tolerance is similar to how Kubernetes approaches fault tolerance. In a kubernetes cluster ( group of virtual machines ) whenever any child pod ( singular virtual machine of the group ) crashes or goes down, could be due to a multitude of reasons for eg. Due to a database connection failing, or a web api failing due to mismatched response. Kubernetes has a control plane that usually decides what to do with the node, and usually the strategy is to restart the pod and check if it works.

Similarly in elixir, there is a master process that takes care of any dead and errored processes. This master will get a :Exit signal whenever a process dies and based on the strategy the process gets recreated. This is done at the language level itself and BEAM ( the erlang VM ) itself takes care of this. This is possible as the elixir processes are isolated and don't have any interdependence. In essence any singular part of the program that is on the process that crashes can be restarted separately without having to worry about the other parts of our code.

