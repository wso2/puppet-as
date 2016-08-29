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

class profiles::wso2as inherits profiles::wso2base {

  $_key_store = hiera('wso2::key_store', { })
  $_trust_store = hiera('wso2::trust_store', { })
  $_is_datasource      = hiera('wso2::is_datasource')
  $_post_configure_resources = hiera('wso2::post_configure_resources', { })

  notice("WSO2 product profile class [name] $title")

  class { '::wso2as':
    # application server specific parameters - start
    template_list             => $_template_list,
    key_store                 => $_key_store,
    trust_store               => $_trust_store,
    is_datasource             => $_is_datasource,
    # application server specific parameters - end

    # system configuration data
    packages                  => $_packages,
    file_list                 => $_file_list,
    system_file_list          => $_system_file_list,
    directory_list            => $_directory_list,
    hosts_mapping             => $_hosts_mapping,

    master_datasources        => $_master_datasources,
    registry_mounts           => $_registry_mounts,
    carbon_home_symlink       => $_carbon_home_symlink,
    wso2_user                 => $_wso2_user,
    wso2_group                => $_wso2_group,
    maintenance_mode          => $_maintenance_mode,
    install_mode              => $_install_mode,
    install_dir               => $_install_dir,
    pack_dir                  => $_pack_dir,
    pack_filename             => $_pack_filename,
    pack_extracted_dir        => $_pack_extracted_dir,
    hostname                  => $_hostname,
    mgt_hostname              => $_mgt_hostname,
    worker_node               => $_worker_node,
    patches_dir               => $_patches_dir,
    service_name              => $_service_name,
    service_template          => $_service_template,
    usermgt_datasource        => $_usermgt_datasource,
    local_reg_datasource      => $_local_reg_datasource,
    clustering                => $_clustering,
    dep_sync                  => $_dep_sync,
    ports                     => $_ports,
    jvm                       => $_jvm,
    ipaddress                 => $_ipaddress,
    fqdn                      => $_fqdn,
    sso_authentication        => $_sso_authentication,
    user_management           => $_user_management,
    enable_secure_vault       => $_enable_secure_vault,
    key_stores                => $_key_stores,
    post_configure_resources  => $_post_configure_resources
  }
}