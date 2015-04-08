# tls-verify
default['openvpn']['tls_verify']['enabled'] = false
default['openvpn']['tls_verify']['dir'] = '/etc/openvpn/tls-verify'
default['openvpn']['tls_verify']['script'] = '/etc/openvpn/tls-verify/verify-cn'
default['openvpn']['tls_verify']['user_file'] = '/etc/openvpn/tls-verify/active_users'

# attribute here so we:
# 1. minimize change in upstream recipes via dedicated tls-verify recipe
# 2. preclude multiple searches over user data bag
default['openvpn']['tls_verify']['users'] = []
