#!/bin/bash

filename="$0"
image="chineseteapot/gitbook-$2"
version="develop"
vol=`pwd`/matchbox
container="gitbook-$2"

Usage() {
  echo "Usage: $filename <command> <attribute>"
  echo "command options:"
  echo "  start   start  service"
  echo "  stop    stop  service"
  echo "  status  display the status of service"
  exit 1
}


START() {
  echo "START $container"
  if [ ! -d "$vol" ]; then
    mkdir $vol
  fi
  docker run -itd --restart=always -p 4000:4000 -v $vol:/book:rw -e BOOKUSER=`id -u` --name $container $image:$version
}

STOP() {
  echo "STOP $container"
  docker rm -f $container
}

RESTART() {
    echo "RESTART $container"
    docker rm -f $container
    START
}


BACKUP() {
  if [ ! -d "$vol" ]; then
    echo "VOLUME $vol doesn't exist"	
    exit 1
  fi
  tar -cf $vol.tar -C $vol .
  tar -tvf $vol.tar
  rm -rf $vol

}

RESTORE() {
  if [ ! -f "$vol".tar ]; then
    echo "$vol.tar doesn't exist, nothing to be restored"
    exit 1
  fi
  mkdir $vol
  tar -xf $vol.tar -C $vol
}

VOLUME_CREATED() {
    if [ -d "$vol" ]; then
        echo "VOLUME $vol exists." 
    else
        echo "VOLUME $vol dose not exist."
    fi
}

SERVICE_CREATED() {
    if [[ $(docker ps -a | grep $container | wc -l) -eq 1 ]]; then
        echo "SERVICE $container exists."
    else
        echo "SERVICE $container does not exist."
    fi
}

TEST() {
    echo ""
    echo "======================= RESULT ======================="
    VOLUME_CREATED
    SERVICE_CREATED
}

STATUS() {
    echo ""
    echo ------------------- $container status --------------------
    docker ps -a | grep $container
}

USAGE() {
    echo $"Usage: $0 {start|stop|restart|status|backup|restore}"
    exit 1
}

case "$1" in
  start)
    START
    TEST
    ;;

  stop)
    STOP
    TEST
    ;;

  restart)
    RESTART
    TEST
    ;;

  backup)
    BACKUP
    ;;

  restore)
    RESTORE
    ;;

  status)
    STATUS
    ;; 

  *)
    USAGE

esac
