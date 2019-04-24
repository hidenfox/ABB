# ABB

##Q5 hardering
*disable tcp wrappers if they are not needed
*close all incoming port son the firewall opening only 22,80,443 if they are needed
*Dissable root login on ssh but on ubuntu is by default
*Enable passwordless login on sshd
*Create sshkey and add only the authorizet key on the authorized_key file for the user
*add clientAliveInterval on sshd to avoid idel connections
*Dissable empty passwords on ssh with PermitEmptyPasswords no option
*configure file2band or csf.conf to avoid brute force attacs or port scanning
*Limit max login attemps with MaxAuthTries to 5
*keep system update
*configure Vnc with password and ssl certificates
---on dockers
*-Setuid/setgid  binaries are the endpoints for the attackers to privilege escalate to root, i.e leading to a complete compromise of the host.
*Disable them by  RUN find / -perm +6000 -type f -exec chmod a-s {} \; \ || true
-- NGINX
*Disable the information leakage with server_token off;
*Protec agains cross-site scriptin atack with add_header X-XSS-Protection "1;mode=block";
*Disable undesirable http methos llike DELETE or TRACE 
'''
    if ($request_method !~ ^(GET|HEAD|POST)$ )
    {
         return 405;
    }
 '''
*Prevent Clickjacking attack with   add_header X-Frame-Options "SAMEORIGIN";
*Add valid certicates o create a own CA to generate well know certs
--OS linux
*Remove un necesary software like 
 '''xinetd nis yp-tools tftpd atftpd tftpd-hpa telnetd rsh-server rsh-redone-server'''
*Locking User Accounts After Login Failures with faillog
*Disable Unwanted Linux Services
*Test some Linux Kernel /etc/sysctl.conf Hardening like I say test because in some cases could be not posible
'''
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
'''
