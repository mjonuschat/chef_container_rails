#
# Cookbook:: container_rails
# Recipe:: default
#
# Copyright:: 2019, Morton Jonuschat <m.jonuschat@mojocode.de>
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

default['container_rails']['app']['server_name'] = '_'
default['container_rails']['app']['friendly_error_pages'] = 'off'
default['container_rails']['app']['env'] = %w[
  RAILS_ENV
  RACK_ENV
  PASSENGER_APP_ENV
  ASSET_HOST
  AWS_ACCESS_KEY_ID
  AWS_REGION
  AWS_SECRET_ACCESS_KEY
  SECRET_KEY_BASE
  DATABASE_URL
  LOGSTASH_URL
  REDIS_URL
]

default['container_rails']['filebeat']['version'] = 'oss-7.x'
