#
# Cookbook:: container_rails
# Recipe:: utilities
#
# Copyright:: 2019, Morton Jonuschat <m.jonuschat@mojocode.de>
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package %w[filebeat] do
  action :upgrade
end

cookbook_file '/etc/filebeat/filebeat.yml' do
  source 'filebeat/filebeat.yml'
  owner 'root'
  group 'root'
  mode '0644'
end

runit_service 'filebeat' do
  default_logger true
  start_down true
end

remote_file '/usr/local/bin/sentry-cli' do
  source "https://github.com/getsentry/sentry-cli/releases/latest/download/sentry-cli-Linux-x86_64"
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
