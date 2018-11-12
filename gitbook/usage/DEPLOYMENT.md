# Deployment

### Download the deployment package
    
You can download the deployment package from web page or command line.

* From web:  
Go to the [release page](https://github.com/ChineseTeapot/gitbook/releases) of this project. Select the package according to the architecture of your machine.

* From command line:  
```bash
wget https://github.com/ChineseTeapot/gitbook/releases/download/[VERSION]/gitbook-[ARCH]-[VERSION].zip
```
  * VERSION : the release tag  
  * ARCH : the architecture of your machine 

  e.g : Deploy a gitbook on a x86 machine with the release 0.0.4 by executing
  ```bash
  wget https://github.com/ChineseTeapot/gitbook/releases/download/0.0.4/gitbook-x86-0.0.4.zip
  ```

### Unzip

```bash
unzip gitbook-[ARCH]-[VERSION].zip
cd gitbook-imageAPI-[ARCH]
```

### Generate the docker compose file

Docker compose file is used for gitbook deployment. Its generation requires three parameters:
* [PORT] : Port of gitbook service.  
* [SOURCE] : Path of gitbook source code.
* [NAME]: Name of docker compose file.
```bash
make config PORT=[PORT] SOURCE=[SOURCE] NAME=[NAME] 
```
e.g : Generate a compose file named `gitbook.yml` .
```bash
make config PORT=4000 SOURCE=/home/user/github/gitbook NAME=gitbook
```
Therefore a compose file named `gitbook.yml` is generated in `/path/to/gitbook-imageAPI-x86/compose/`.
```yaml
# gitbook.yml
services:
  gitbook:
    environment:
      BOOKUSER: '1000'
    image: chineseteapot/gitbook-x86:0.0.4
    ports:
    - published: 4000
      target: 4000
    restart: always
    volumes:
    - /home/user/github/gitbook:/book:rw
version: '3.2'
```

### Start the service
Start the service with the name you specified in the config step above.
```bash 
make start NAME=[COMP_NAME]
```
e.g: start service `gitbook`
```bash
cd gitbook-imageAPI-x86/
make start NAME=gitbook
```
After starting the service successfully, you may see the output similar with the following: 
```
docker-compose -p gitbook -f /path/to/gitbook-imageAPI-x86/compose/gitbook.yml up -d
```

### Restart the service
```bash
make restart NAME=[COMP_NAME]
```
e.g
```bash
make restart NAME=gitbook
```
After restarting the service successfully, you may see the output similar with the following:
```
docker-compose -p gitbook -f /path/to/gitbook-imageAPI-x86/compose/gitbook.yml up -d --force-recreate
```

### Check status of the service
```bash
make status NAME=[COMP_NAME]
```
e.g,
```bash
make status NAME=gitbook
```
You may see the output similar with the following:
```
docker-compose -p gitbook -f /path/to/gitbook-imageAPI-x86/compose/gitbook.yml ps
docker-compose -p gitbook -f /path/to/gitbook-imageAPI-x86/compose/gitbook.yml logs
```

### Stop the service
```bash
make stop NAME=[COMP_NAME]
```
e.g,
```bash
make stop NAME=gitbook
```
After stoping the service successfully, you may see the output similar with the following:
```
docker-compose -p gitbook -f /path/to/gitbook-imageAPI-x86/compose/gitbook.yml down
```

### List the services
```bash
make list NAME=[COMP_NAME]
```
e.g,
```bash
make list NAME=gitbook
```
You may see the output similar with the following:
```
for compose in `ls /path/to/gitbook-imageAPI-x86/compose`;do name=`echo $compose|awk -F "." '{print $1}'`;echo $name;docker-compose -p $name -f /path/to/gitbook-imageAPI-x86/compose/$compose ps;done
gitbook
Name                     Command        State          Ports
------------------------------
gitbook_gitbook_1   /bin/sh -c ./init   Up      0.0.0.0:4000->4000/tcp
```

### Remove the compose file
```bash
make remove NAME=[COMP_NAME]
```
e.g,
```bash
make remove NAME=gitbook
```
You may see the output similar with the following:
```
rm /path/to/gitbook-imageAPI-x86/compose/gitbook.yml
```
Check whether the remove step successfully:
```bash
ls compose | grep gitbook
```

