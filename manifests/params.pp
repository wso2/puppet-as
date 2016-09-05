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

  if ($::use_hieradata == true) {
    $is_datasource        = hiera('wso2::is_datasource')
    $template_list        = hiera_array('wso2::template_list')
    $platform_version     = hiera('wso2::platform_version')

  } else {
    $as_template_list     = [
      'repository/conf/identity.xml',
    ]
    $template_list = concat($wso2base::params::template_list, $as_template_list)
    $is_datasource        = 'wso2_carbon_db'
    $platform_version     = '4.4.0'
  }
}