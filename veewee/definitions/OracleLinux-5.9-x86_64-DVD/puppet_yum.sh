# Install Puppet

source ./proxy.sh

cd /tmp
wget https://yum.puppetlabs.com/el/5/products/x86_64/puppetlabs-release-5-7.noarch.rpm
rpm -Uvh puppetlabs-release-5-7.noarch.rpm
rm -f /tmp/puppetlabs-release-5-7.noarch.rpm

# To do
# Need to fix dependency issue before switching to Puppet Labs YUM Repo
yum -y install puppet facter
