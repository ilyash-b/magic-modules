# Copyright 2017 Google Inc.
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

require 'vcr_config'

title 'GCP Zone resource test'

control 'gcp-zone-1.0' do

  impact 1.0
  title 'Ensure single GCP zone resource works.'
  # TODO(slevenick): remove only_if once we generate this again
  only_if { false }
  VCR.use_cassette('gcp-zone') do
    resource = google_compute_zone({project: attribute('project_name'), name: attribute('zone')})

    describe resource do
      it { should exist }
      its('status') { should cmp 'UP' }
    end
  end
end