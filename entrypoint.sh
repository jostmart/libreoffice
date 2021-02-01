#!/bin/sh

/usr/bin/libreoffice "-accept=socket,host=127.0.0.1,port=8997,tcpNoDelay=1;urp;" --nologo --norestore --invisible --nolockcheck --nodefault --headless "$@"
if [ -d "/tmp/hsperfdata_root" ]; then
	rm -rf /tmp/hsperfdata_root
fi
