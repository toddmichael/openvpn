#
# Cookbook Name:: openvpn
# Recipe:: tls-verify 
#
# Copyright 2009-2013, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# create tls-verify directory
directory node['openvpn']['tls_verify']['dir'] do
  owner 'root'
  group 'root'
  mode 00755
end

# upload tls verify script
cookbook_file node['openvpn']['tls_verify']['script'] do
  owner 'root'
  group 'openvpn'
  mode 00754
end

# create blank allowed_users file
# working file to be populated via users recipe
file node['openvpn']['tls_verify']['user_file'] do
  action :create_if_missing
  mode 00660
  owner 'root'
  group 'openvpn'
end

# tls-verify whitelist file
if node['openvpn']['tls_verify']['enabled']
  template node['openvpn']['tls_verfiy']['user_file'] do
    mode 00644
    owner 'root'
    group 'openvpn'
    variables(
      :users => users
    )
  end
end
