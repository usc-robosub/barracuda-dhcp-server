# barracuda-dhcp-server
This container will run a configured custom DHCP server on the Jetson Orin. It is modularized using Docker and can be quickly installed by pulling the repository on the machine.

To Build and Start Container
```docker compose up -d```

To Stop and Remove All Images and Orphans
```docker compose down --remove-orphans --rmi all```