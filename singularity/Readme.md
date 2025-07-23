

### Singularity

Singularity is a container orchestration platform just like docker. But it does not run contaners as root which is a main reason for its popularity and people prefer this over docker.

In my experience the documentation is not super well maintained and the sylabs container registry is not super stable, with a lot of breaking changes.
(why do you even change the file format you guys)



But it serves it's purpose very well and is loved by many



### building Singularity sandbox

sudo singularity build --sandbox brad_sandbox brad.def


singularity instance list



### Installation
This can only be run on linux system. So WSL or VM's for anyone using anything other than linux.

In my experience not the easiest package to set up and run on a system. This requires a lot of playing around and understanding which version to run.
I found version 3.1.x to be the easisest to setup although the current version is at 3.8


The instructions are more or less taken from here with a bit of changes
link : https://github.com/apptainer/singularity/blob/master/INSTALL.md


Install tool libraries

```
# Ensure repositories are up-to-date
sudo apt-get update

# Install debian packages for dependencies
sudo apt-get install -y \
build-essential \
libseccomp-dev \
pkg-config \
squashfs-tools \
cryptsetup \
curl wget git

```


Install go ( singularity is written in go )

```
# go installation
export GOVERSION=1.17.3 OS=linux ARCH=amd64

wget -O /tmp/go${GOVERSION}.${OS}-${ARCH}.tar.gz \
https://dl.google.com/go/go${GOVERSION}.${OS}-${ARCH}.tar.gz
sudo tar -C /usr/local -xzf /tmp/go${GOVERSION}.${OS}-${ARCH}.tar.gz

# adding go location to path
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc
```


Cloning singularity

```
git clone https://github.com/hpcng/singularity.git
cd singularity
git checkout v3.1.1
```


Compiling

```
./mconfig
cd ./builddir
make
sudo make install
```

Check version

```
singularity --version
```



And hopefully if you are lucky that should install singularity for you!
