box_name="slippers-golang-ubuntu-16.10"

vagrant box add --force $box_name builds/VirtualBox-ubuntu-server-16.10.box
mkdir -p workbench
pushd workbench
vagrant init $box_name
popd
