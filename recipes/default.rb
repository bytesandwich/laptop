#
# Cookbook:: laptop
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.


user 'jack' do
  comment 'me'
  home '/home/jack'
  shell '/bin/bash'
  manage_home true
end

package "tmux"

# docker
package "docker-ce"
package "docker-ce-cli"
package "containerd.io"

# packages for qemu, kvm
package "qemu-kvm"
package "libvirt-dev"
package "libvirt-daemon-system"
package "libvirt-clients"
package "bridge-utils"
package "virt-manager"

# Add me to groups for libvert, kemu

group "libvert" do
  action :manage
  members "jack"
  append true
end
group "kvm" do
  action :manage
  members "jack"
  append true
end

# vagrant
apt_repository 'hashicorp' do
  uri 'https://apt.releases.hashicorp.com'
  key 'https://apt.releases.hashicorp.com/gpg'
  distribution 'focal'
  components ['main']
  arch 'amd64'
  action :add
end

apt_repository 'docker' do
  uri 'https://download.docker.com/linux/ubuntu'
  key 'https://download.docker.com/linux/ubuntu/gpg'
  distribution 'focal'
  components ['stable']
  arch 'amd64'
  action :add
end

package "vagrant"
package "packer"

package "autoconf"
package "automake"
package "autopoint"
package "autotools-dev"
package "build-essential"
package "debhelper"
package "devscripts"
package "dh-autoreconf"
package "dh-strip-nondeterminism"
package "dpkg-dev"
package "dwz"
package "fakeroot"
package "g++"
package "g++-9"
package "gcc"
package "gcc-9"
package "gem2deb"
package "gem2deb-test-runner"
package "gettext"
package "intltool-debian"
package "libarchive-zip-perl"
package "libasan5"
package "libatomic1"
package "libb-hooks-op-check-perl"
package "libclass-method-modifiers-perl"
package "libcroco3"
package "libdebhelper-perl"
package "libdevel-callchecker-perl"
package "libdynaloader-functions-perl"
package "libfakeroot"
package "libfile-homedir-perl"
package "libfile-stripnondeterminism-perl"
package "libfile-which-perl"
package "libgcc-9-dev"
package "libimport-into-perl"
package "libio-pty-perl"
package "libipc-run-perl"
package "libitm1"
package "liblsan0"
package "libmodule-runtime-perl"
package "libmoo-perl"
package "libparams-classify-perl"
package "librole-tiny-perl"
package "libstdc++-9-dev"
package "libstrictures-perl"
package "libsub-override-perl"
package "libsub-quote-perl"
package "libtool"
package "libtsan0"
package "libubsan1"
package "m4"
package "make"
package "patchutils"
package "po-debconf"
package "ruby-all-dev"
package "ruby-setup"
package "wdiff"

execute "install vagrant plugin libvirt" do
  user "jack"
  environment ({ 'HOME' => '/home/jack' })
  command "vagrant plugin install vagrant-libvirt"
end


apt_update 'all platforms' do
  frequency 86400
  action :periodic
end

# Anki
package "anki"

package "lubuntu-desktop"

package "terminator"

package "xmonad"
package "libghc-xmonad-contrib-dev"

package "suckless-tools"

# TPM
# package "trousers"

# system utilities
package "d-feet"

package "ethtool"
package "net-tools"

package "mlocate"

package "sysstat"

package "htop"

package "linux-tools-common"
package "linux-tools-generic"
package "linux-tools-5.8.0-50-generic"


