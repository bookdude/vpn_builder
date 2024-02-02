client_ovpn_generator is the runfile.

1) client_ovpn_generator builds a working file with client names that contain a name-prefix, and a number.
vpn_builder.client
product files are sent per line #1117 in openvpn-install.sh to /opt/vpn_builder/client_vpn_files"

This an be adjusted on lines 1098 - 1117 in openvpn-install.sh


2) the vpn-user-build.sh is a loop shell script that the vpn_builder_client is piped into.

3) The openvpn-install.sh is the work file that produces all of the ovpn files.


