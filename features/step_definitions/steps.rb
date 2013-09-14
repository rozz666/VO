require 'rspec'

Then /^I run the simulation$/ do
  %x(./bin/vo)
  $?.should eq(0), "exit code: #{$?}"
end
