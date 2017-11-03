# qemu-arm
Docker file for fu berlin qemu arm version

# how-to use
1. put shared arm folder from course in same dir
2. build container with `sudo docker build -t qemu-arm .`
3. run with `sudo docker run --name qemu -it --rm -p 444:444 -v /home/stefaus/workspaces/Docker/qemu-arm/workspace:/home/mi/linnert/arm/workspace qemu-arm:latest` change workspace folder accordingly
4. to get a additional bash use `sudo docker exec -it qemu bash`

# remarks
- in workspace folder is the `Makefile` and other stuff from the course, `make` will create led example
- `qemu-asprak` is a modified version of `qemu-bsprak` to use telnet outside the container, in this case connect from host with `telnet 127.0.0.1 444`
- eduroam at fu berlin is blocking external dns servers -> vpn to unblocked internet or reconfigure docker dns
