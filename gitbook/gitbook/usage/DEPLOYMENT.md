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

  e.g : Deploy a gitbook on a x86 machine with the release 0.5.6 by executing
  ```bash
  wget https://github.com/ChineseTeapot/gitbook/releases/download/0.5.6/gitbook-x86-0.5.6.zip
  ```

### Unzip

```bash
unzip gitbook-[ARCH]-[VERSION].zip
cd gitbook-imageAPI-[ARCH]
```

### Generate the docker compose file

Docker compose file is used for gitbook deployment. Its generation requires three parameters:
* [VARIABLE] : EXPLAINATION.  


```bash
make config 
```

e.g : Generate a compose file named `[NAME].yml` .
cd ~/gitbook-x86/
make config 
```
Therefore a compose file named `[NAME].yml` is generated in `~/gitbook-imageAPI-x86/compose/`.
```yaml
# [NAME].yml
```

### Start the service
Start the service with the name you specified in the config step above.
```bash 
make start NAME=[COMP_NAME]
```
e.g: start service `[NAME]`
```bash
cd gitbook-imageAPI-x86/
make start NAME=[NAME]
```
After starting the service successfully, you may see the output similar with the following: 
```
docker-compose -p [NAME] -f ~/gitbook-imageAPI-x86/compose/[NAME].yml up -d

```

### Restart the service
```bash
make restart NAME=[COMP_NAME]
```
e.g
```bash
make restart NAME=[NAME]
```
After restarting the service successfully, you may see the output similar with the following:
```
docker-compose -p [NAME] -f ~/gitbook-imageAPI-x86/compose/[NAME].yml up -d --force-recreate
```

### Check status of the service
```bash
make status NAME=[COMP_NAME]
```
e.g,
```bash
make stop NAME=[NAME]
```
You may see the output similar with the following:
```
docker-compose -p [NAME] -f ~/gitbook-imageAPI-x86/compose/[NAME].yml ps
docker-compose -p [NAME] -f ~/gitbook-imageAPI-x86/compose/[NAME].yml logs
```

### Stop the service
```bash
make stop NAME=[COMP_NAME]
```
e.g,
```bash
make stop NAME=[NAME]
```
After stoping the service successfully, you may see the output similar with the following:
```
docker-compose -p [NAME] -f ~/gitbook-imageAPI-x86/compose/[NAME].yml down
```

### List the services
```bash
make list
```
You may see the output similar with the following:
```
for compose in `ls ~/gitbook-imageAPI-x86/compose`;do name=`echo $compose|awk -F "." '{print $1}'`;echo $name;docker-compose -p $name -f ~/gitbook-imageAPI-x86/compose/$compose ps;done
[NAME]
Name   Command   State   Ports
------------------------------
...
```

### Remove the compose file
```bash
make remove NAME=[COMP_NAME]
```
e.g,
```bash
make remove NAME=[NAME]
```
You may see the output similar with the following:
```
rm ~/gitbook-imageAPI-x86/compose/[NAME].yml
```
Check whether the remove step successfully:
```bash
ls compose | grep [NAME]
```

