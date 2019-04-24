# ABB
---Q1 Automated provisioning: I decide to use ansible because it needs less infraestructure that puppet or chef and is more easy for to deploy. on the repo ansible-abb you can find all roles and you only need the comand 
 ```ansible-playbook playbook.yml ```  to applay all.
 * It must be a issue on git because it try to import the key to de github but in some situatios it fails, in this case if you add manually all works find
---Q2 Scripting:
* The scrips are simple it will be more complex checking if really the browser is closed or the dockers are up and down but for a demo is it ok the files are copied and de desktop is configured by ansible role deskconfig
---Q3 Web app optimization
* The conf.d and the ssl directories are mounted on the docker frontend, the conf.d is configured intercepting port 3000 and redirect to the backed who is listening on 3001.  I decide this solution because it needs a minum changes and I don't need to touch the backend code 
--- Q4 Linux Networking
* After to fight with stunnel configuration I decide to will be easy and more secure configure an openvpn and the vnc configured on mode reverse the viewer must be started as a listener I store the files on de Q4 directory 
--- Q5 Linux Hardening
* disable tcp wrappers if they are not needed
* close all incoming port on the firewall opening only 22,80,443 if they are needed
* Disable root login on ssh but on Ubuntu is by default
* Enable passwordless login on sshd
* Create sshkey and add only the authorized key on the authorized_key file for the user
* add clientAliveInterval on sshd to avoid idle connections
* Disable empty passwords on ssh with PermitEmptyPasswords no option
* configure file2band or csf.conf to avoid brute force attacks or port scanning
* Limit max login attempts with MaxAuthTries to 5
* keep system update
* configure Vnc with password and ssl certificates
-- Dockers
* -Setuid/setgid binaries are the endpoints for the attackers to privilege escalate to root, i.e leading to a complete compromise of the host.
* Disable them by  ```RUN find / -perm +6000 -type f -exec chmod a-s {} \; \ || true```
-- NGINX
* Disable the information leakage with server_token off;
* Protect against cross-site scripting attack with add_header X-XSS-Protection "1;mode=block";
* Disable undesirable http method like DELETE or TRACE 
```
    if ($request_method !~ ^(GET|HEAD|POST)$ )
    {
         return 405;
    }
 ```
* Prevent Clickjacking attack with   add_header X-Frame-Options "SAMEORIGIN";
* Add valid certicates o create a own CA to generate well know certs
--OS linux
* Remove un necesary software like 
 ```xinetd nis yp-tools tftpd atftpd tftpd-hpa telnetd rsh-server rsh-redone-server```
* Locking User Accounts After Login Failures with faillog
* Disable Unwanted Linux Services
* Test some Linux Kernel /etc/sysctl.conf Hardening like I say test because in some cases could be not posible
```
# Turn on execshield
kernel.exec-shield=1
kernel.randomize_va_space=1
# Enable IP spoofing protection
net.ipv4.conf.all.rp_filter=1
# Disable IP source routing
net.ipv4.conf.all.accept_source_route=0
# Ignoring broadcasts request
net.ipv4.icmp_echo_ignore_broadcasts=1
net.ipv4.icmp_ignore_bogus_error_messages=1
# Make sure spoofed packets get logged
net.ipv4.conf.all.log_martians = 1
Turn off IPV6 if not used
```
