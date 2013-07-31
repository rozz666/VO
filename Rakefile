task :default => :test

desc "run spec examples"
task :spec do
  sh 'rspec'
end

desc "run feature scenarios"
task :features do
  sh 'cucumber -p regression'
end

desc "run WIP feature scenarios"
task :wip_features do
  sh 'cucumber -p wip'
end

desc "run all examples and scenarios (default)"
task :test => [:spec, :features] do
end

desc "run all examples and WIP scenarios"
task :wip => [:spec, :wip_features] do
end
