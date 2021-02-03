
### Starting the container on selinux enabled host

docker run -p 127.0.0.1:8997:8997 -v /tmp/convert/:/tmp/convert:z -it -d jostmart/libreoffice:latest

If your container host don't use selinux, remove z from the mount options


### Parameters to libreoffice

Example configuration parameters to the libreoffice process line in entrypoint.sh

```
root@someos:/$ libreoffice --headless 
                --accept="socket,host=0,port=8001,tcpNoDelay=1;urp"
                --nodefault --nofirststartwizard --nolockcheck
                --nologo --norestore --invisible &
```

Please note that the arguments to --accept are within "".


In this way another server can connect to the LibreOffice listner through the UNO API  on the defined port. Let’s describe most of the above parameters:


- –accept Specify a UNO connect-string to create a UNO acceptor through which other programs can connect to access the API. In the above case it creates the acceptor on the port 8001 of this server (localhost).
- –nodefault tells that no default document must be created at startup.
- –nolockcheck disables the check for remote instances using the installation.
- –nologo Disables the splash screen at program start.
- –norestore Disables restart and file recovery after a system crash. It is possible that LO will try to restore a file it keeps crashing on, if that happens –norestore is the only way to start LO.
- –nosplash Disables the splash screen at program start.
- –invisible This prepares Libreoffice to be used as service because it’s available but not visible in background.

The last & is not a typing error: it tells the shell “do not wait for the end of the task, execute it and let me use the shell again”: simply “Multitasking” :-)
