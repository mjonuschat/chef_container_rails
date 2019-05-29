#
# Cookbook:: container_rails
# Recipe:: prepare
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

file '/etc/nginx/sites-enabled/default' do
  action :delete
end

template '/etc/nginx/main.d/default-rails-env.conf' do
  source 'passenger/env.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template '/etc/nginx/sites-enabled/passenger.conf' do
  source 'passenger/site.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

runit_service 'clockwork' do
  default_logger true
  start_down true
end

runit_service 'sidekiq' do
  default_logger true
  start_down true
end
