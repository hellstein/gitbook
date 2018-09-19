<p align="center">
  <img width="500" src="https://www.gitbook.com/public/images/f5fde7c87273057f8e0f9ff934df552d.png">
</p>

<h1 align="center"> Gitbook </h1>
<p align="center">
  <b >docker image of gitbook</b>
</p>
<br>


![Travis (.org) branch](https://img.shields.io/travis/ChineseTeapot/gitbook/master.svg)
![GitHub](https://img.shields.io/github/license/ChineseTeapot/gitbook.svg)

`   armv6:   `
[![Docker Pulls](https://img.shields.io/docker/pulls/chineseteapot/gitbook-armv6.svg)](https://hub.docker.com/r/chineseteapot/gitbook-armv6/tags/)

`   x86:    `
[![Docker Pulls](https://img.shields.io/docker/pulls/chineseteapot/gitbook-x86.svg)](https://hub.docker.com/r/chineseteapot/gitbook-x86/tags/)

# Deployment ( for end user)

### Through script

* Fetch the code
  ```
  git clone https://github.com/chineseteapot/gitbook.git
  ```
  
* Run gitbook
  ```
  ./ctl start <arch>
  ```
  We support `x86` only currently.

* Check the status
  ```
  ./ctl status
  ```

* Stop gitbook service
  ```
  ./ctl stop <arch>
  ```


### Through docker cli

* Start gitbook
  ```
  mkdir matchbox
  touch matchbox/README.md
  docker run -itd --restart=always -p 4000:4000 -v `pwd`/matchbox:/book:rw -e BOOKUSER=`id -u` --name gitbook-x86 chineseteapot/gitbook:develop
  ``` 

* Stop gitbook
  ```
  docker rm -f gitbook-x86
  ```

# Getting Started ( for developer )

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Prerequisites

* Docker
* Travis client

### Local Build

```
git clone https://github.com/chineseteapot/gitbook.git
cd gitbook
./build <arch>
```

### Built With Travis CI

* `.travis.yml` for build configuration
* `set_docker_account` and `.env` is for create docker credential


# Logistics

### Contributing

Please read [CONTRIBUTING.md](https://github.com/ChineseTeapot/gitbook/blob/master/docs/CONTRIBUTING.md) for contributing.
For details on our [code of conduct](https://github.com/ChineseTeapot/gitbook/blob/master/docs/CODE_OF_CONDUCT.md), and the process for submitting pull requests to us.

### Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the tags on this repository

### Authors

* **dorrywhale** - *Initial work* - [dorrywhale](https://github.com/dorrywhale)

See also the list of [contributors](https://github.com/ChineseTeapot/gitbook/graphs/contributors) who participated in this project.

### Acknowledgments

See [Acknowledgments](https://github.com/ChineseTeapot/gitbook/blob/master/docs/ACKNOWLEDGMENTS.md)


### License

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/ChineseTeapot/gitbook/blob/master/LICENSE.md) file for details

