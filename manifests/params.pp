#----------------------------------------------------------------------------
#  Copyright (c) 2016 WSO2, Inc. http://www.wso2.org
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#----------------------------------------------------------------------------

class wso2as::params {

  $template_list          = [
    'repository/conf/carbon.xml',
    'repository/conf/user-mgt.xml',
    'repository/conf/registry.xml',
    'repository/conf/identity.xml',
    'repository/conf/datasources/master-datasources.xml',
    'repository/conf/tomcat/catalina-server.xml',
    'repository/conf/axis2/axis2.xml',
    'repository/conf/security/authenticators.xml',
    'bin/wso2server.sh'
  ]
  $key_store                                                = undef
  $trust_store                                              = undef

  # $data1 = {'/mnt/foo' => { ensure => 'directory' }}
  # $data2 = {'isuruh.org' => { name => 'isuruh.org', ensure => 'present', ip => '10.100.0.168'} }
  # $post_install_resources                                   = [ {type => 'file', data => $data1}, {type => 'host', data => $data2} ]
  $post_install_resources                                   = undef
  # $data3 = {'isuruh.com' => { name => 'isuruh.com', ensure => 'present', ip => '10.100.0.169'} }
  $post_configure_resources                                 = undef
  # $post_configure_resources                                 = [ {type => 'host', data => $data3} ]
  $data4                                                      = { resource1 => { param1 =>'value1', param2 => 'value2' } }
  $post_start_resources                                       = [{ type => 'wso2as::dynamic_type', data => $data4 }]
  # $post_start_resources                                     = undef
  # apim specific parameters - end

  # # common parameters - start
  # $java_class             = 'wso2base::java'
  # $java_prefs_system_root = '/home/wso2user/.java'
  # $java_prefs_user_root   = '/home/wso2user/.java/.systemPrefs'
  # $java_home              = '/opt/java'
  # # system configuration data
  # $packages               = [
  #   'zip',
  #   'unzip'
  # ]
  # $template_list          = [
  #   'repository/conf/carbon.xml',
  #   'repository/conf/user-mgt.xml',
  #   'repository/conf/registry.xml',
  #   'repository/conf/datasources/master-datasources.xml',
  #   'repository/conf/datasources/am-datasources.xml',
  #   'repository/conf/tomcat/catalina-server.xml',
  #   'repository/conf/axis2/axis2.xml',
  #   'repository/conf/security/authenticators.xml',
  #   'bin/wso2server.sh'
  # ]
  # $file_list              = []
  # $system_file_list       = []
  # $directory_list         = []
  # $hosts_mapping          = {
  #   localhost => {
  #     ip => '127.0.0.1',
  #     name => 'localhost'
  #   }
  # }
  # $master_datasources     = {
  #   wso2_carbon_db  => {
  #     name => 'WSO2_CARBON_DB',
  #     description => 'The datasource used for registry and user manager',
  #     driver_class_name => 'org.h2.Driver',
  #     url => 'jdbc:h2:repository/database/WSO2CARBON_DB;DB_CLOSE_ON_EXIT=FALSE;LOCK_TIMEOUT=60000',
  #     username => 'wso2carbon',
  #     password => 'wso2carbon',
  #     jndi_config => 'jdbc/WSO2CarbonDB',
  #     max_active => '50',
  #     max_wait => '60000',
  #     test_on_borrow => true,
  #     default_auto_commit => false,
  #     validation_query => 'SELECT 1',
  #     validation_interval => '30000'
  #   }
  # }
  # $registry_mounts        = []
  # $carbon_home_symlink    = "/mnt/${::product_name}-${::product_version}"
  # $wso2_user              = 'wso2user'
  # $wso2_group             = 'wso2'
  # $maintenance_mode       = 'refresh'
  # $install_mode           = 'file_bucket'
  # $install_dir            = "/mnt/${::ipaddress}"
  # $pack_dir               = '/mnt/packs'
  # $pack_filename          = "${::product_name}-${::product_version}.zip"
  # $pack_extracted_dir     = "${::product_name}-${::product_version}"
  # $hostname               = 'localhost'
  # $mgt_hostname           = 'apim.wso2.com'
  # $worker_node            = false
  # $patches_dir            = 'repository/components/patches'
  # $service_name           = "${::product_name}"
  # $service_template       = 'wso2base/wso2service.erb'
  # $usermgt_datasource     = 'wso2_carbon_db'
  # $local_reg_datasource   = 'wso2_carbon_db'
  # $clustering             = {
  #   enabled => false,
  #   membership_scheme => 'wka',
  #   domain => 'wso2.carbon.domain',
  #   local_member_host => '127.0.0.1',
  #   local_member_port => '4000',
  #   sub_domain => 'mgt',
  #   wka => {
  #     members => [
  #       {
  #         hostname => '127.0.0.1',
  #         port => 4000
  #       }
  #     ]
  #   }
  # }
  # $dep_sync               = {
  #   enabled => false
  # }
  # $ports                  = {
  #   offset => 0
  # }
  # $jvm                    = {
  #   xms => '256m',
  #   xmx => '1024m',
  #   max_perm_size => '256m'
  # }
  # $ipaddress              = "${::ipaddress}"
  # $fqdn                   = "${::fqdn}"
  # $sso_authentication     = {
  #   enabled => false
  # }
  # $user_management        = {
  #   admin_role      => 'admin',
  #   admin_username  => 'admin',
  #   admin_password  => 'admin'
  # }
  # $enable_secure_vault    = false
  # $key_stores             = {
  #   key_store => {
  #     location => 'repository/resources/security/wso2carbon.jks',
  #     type => 'JKS',
  #     password => 'wso2carbon',
  #     key_alias => 'wso2carbon',
  #     key_password => 'wso2carbon'
  #   },
  #   registry_key_store => {
  #     location => 'repository/resources/security/wso2carbon.jks',
  #     type => 'JKS',
  #     password => 'wso2carbon',
  #     key_alias => 'wso2carbon',
  #     key_password => 'wso2carbon'
  #   },
  #   trust_store => {
  #     location => 'repository/resources/security/client-truststore.jks',
  #     type => 'JKS',
  #     password => 'wso2carbon'
  #   },
  #   connector_key_store => {
  #     location => 'repository/resources/security/wso2carbon.jks',
  #     password => 'wso2carbon'
  #   },
  #   user_trusted_rp_store => {
  #     location => 'repository/resources/security/userRP.jks',
  #     type => 'JKS',
  #     password => 'wso2carbon',
  #     key_password => 'wso2carbon'
  #   }
  # }
  # # common parameters - end
}