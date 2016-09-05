# ------------------------------------------------------------------------------
# Copyright (c) 2016, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ------------------------------------------------------------------------------

# Manages WSO2 Application Server deployment
class wso2as (

  $is_datasource          = $wso2as::params::is_datasource,
  $platform_version       = $wso2as::params::platform_version,
  $template_list          = $wso2as::params::template_list,

  # system configuration data
  $packages               = $wso2base::params::packages,
  $template_list          = $wso2base::params::template_list,
  $file_list              = $wso2base::params::file_list,
  $cert_list              = $wso2base::params::cert_list,
  $system_file_list       = $wso2base::params::system_file_list,
  $directory_list         = $wso2base::params::directory_list,
  $hosts_mapping          = $wso2base::params::hosts_mapping,
  $java_home              = $wso2base::params::java_home,
  $java_prefs_system_root = $wso2base::params::java_prefs_system_root,
  $java_prefs_user_root   = $wso2base::params::java_prefs_user_root,

  $product_name           = $wso2base::params::product_name,
  $product_version        = $wso2base::params::product_version,
  $vm_type                = $wso2base::params::vm_type,
  $patch_list             = $wso2base::params::patch_list,
  $master_datasources     = $wso2base::params::master_datasources,
  $registry_mounts        = $wso2base::params::registry_mounts,
  $carbon_home_symlink    = $wso2base::params::carbon_home_symlink,
  $wso2_user              = $wso2base::params::wso2_user,
  $wso2_group             = $wso2base::params::wso2_group,
  $maintenance_mode       = $wso2base::params::maintenance_mode,
  $install_mode           = $wso2base::params::install_mode,
  $install_dir            = $wso2base::params::install_dir,
  $pack_dir               = $wso2base::params::pack_dir,
  $pack_filename          = $wso2base::params::pack_filename,
  $pack_extracted_dir     = $wso2base::params::pack_extracted_dir,
  $hostname               = $wso2base::params::hostname,
  $mgt_hostname           = $wso2base::params::mgt_hostname,
  $worker_node            = $wso2base::params::worker_node,
  $patches_dir            = $wso2base::params::patches_dir,
  $service_name           = $wso2base::params::service_name,
  $service_template       = $wso2base::params::service_template,
  $usermgt_datasource     = $wso2base::params::usermgt_datasource,
  $local_reg_datasource   = $wso2base::params::local_reg_datasource,
  $clustering             = $wso2base::params::clustering,
  $dep_sync               = $wso2base::params::dep_sync,
  $ports                  = $wso2base::params::ports,
  $jvm                    = $wso2base::params::jvm,
  $ipaddress              = $wso2base::params::ipaddress,
  $fqdn                   = $wso2base::params::fqdn,
  $sso_authentication     = $wso2base::params::sso_authentication,
  $user_management        = $wso2base::params::user_management,
  $enable_secure_vault    = $wso2base::params::enable_secure_vault,
  $secure_vault_configs   = $wso2base::params::secure_vault_configs,
  $key_stores             = $wso2base::params::key_stores
) inherits wso2as::params {

  class { '::wso2base':
    packages               => $packages,
    template_list          => $template_list,
    file_list              => $file_list,
    patch_list             => $patch_list,
    cert_list              => $cert_list,
    system_file_list       => $system_file_list,
    directory_list         => $directory_list,
    hosts_mapping          => $hosts_mapping,
    java_home              => $java_home,
    java_prefs_system_root => $java_prefs_system_root,
    java_prefs_user_root   => $java_prefs_user_root,
    vm_type                => $vm_type,
    wso2_user              => $wso2_user,
    wso2_group             => $wso2_group,
    product_name           => $product_name,
    product_version        => $product_version,
    platform_version       => $platform_version,
    carbon_home_symlink    => $carbon_home_symlink,
    maintenance_mode       => $maintenance_mode,
    install_mode           => $install_mode,
    install_dir            => $install_dir,
    pack_dir               => $pack_dir,
    pack_filename          => $pack_filename,
    pack_extracted_dir     => $pack_extracted_dir,
    patches_dir            => $patches_dir,
    service_name           => $service_name,
    service_template       => $service_template,
    ipaddress              => $ipaddress,
    enable_secure_vault    => $enable_secure_vault,
    secure_vault_configs   => $secure_vault_configs,
    key_stores             => $key_stores,
  }

  include '::wso2base::install'
  include '::wso2base::configure'
  include '::wso2base::service'

  Class['::wso2base::install'] -> Class['::wso2base::configure'] ~> Class['::wso2base::service']
}