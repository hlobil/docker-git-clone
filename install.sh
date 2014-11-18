set -ex

apt-get update -qq 

# install git
DEBIAN_FRONTEND=noninteractive apt-get -qq -y --no-install-recommends install git openssh-client

# cleanup apt cache to save image space
apt-get -qqy autoclean
apt-get -qqy clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*



# prime known_hosts with the github.com public key
#
# [anga.funkfeuer.at]:2022,[78.41.115.130]:2022 ssh-rsa AAAAB...fgTHaojQ==

mkdir -p /root/.ssh

ssh-keyscan -t rsa,dsa github.com >> /root/.ssh/known_hosts
ssh-keyscan -t rsa,dsa bitbucket.com >> /root/.ssh/known_hosts


