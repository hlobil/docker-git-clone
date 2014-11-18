docker-git-clone
================


## paremeters

#### required
```
$GIT_REPO
```
#### optional
```
$GIT_BRANCH 
$GIT_REV
```

## build 
```
docker build --rm --tag=git-clone .
```


## run (using ssh-agent)
``` bash
docker run --rm -i -t \
	-v $(readlink -f $SSH_AUTH_SOCK):/ssh-agent \
	-e SSH_AUTH_SOCK=/ssh-agent \
	-e GIT_REPO=git@github.com:hlobil/docker-git-clone.git \
	-e GIT_BRANCH=master \
	git-clone
```

## run (with ssh-agent, custom-command)
``` bash
docker run --rm -i -t \
	-v $(readlink -f $SSH_AUTH_SOCK):/ssh-agent \
	-e SSH_AUTH_SOCK=/ssh-agent \
	git-clone bash
```



# boot2docker

## use ~/.ssh/config
```
Host b2d
	HostName localhost
	User docker
	ServerAliveInterval 15
	Compression yes
	ForwardAgent yes
	Port 2022
	IdentityFile ~/.ssh/id_boot2docker
```
	
## use alias
``` bash
function ssh-b2d(){
	ssh \
		-i $HOME/.ssh/id_boot2docker \
		-p $(boot2docker config 2>&1 | awk '/SSHPort/ {print $3}') \
		docker@localhost
}
```

## troubleshooting ssh-agent
https://developer.github.com/guides/using-ssh-agent-forwarding/