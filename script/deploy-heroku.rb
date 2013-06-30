#!/usr/bin/env ruby

require 'heroku-headless'
def pull_request_number
  ENV['TRAVIS_PULL_REQUEST']
end

def pull_request?
  pull_request_number && pull_request_number != 'false'
end

def deployable_branch?
  !!server_for_branch
end

def deployable?
  pull_request? || deployable_branch?
end

def server_for_branch
  branch = ENV['TRAVIS_BRANCH']
  case branch
  when 'master'
    'production'
  else
    puts "No server configured for #{branch_name}..."
  end
end

def derive_server_name(base_name)
  if pull_request?
    "#{base_name}-#{pull_request_number}"
  else
    "#{base_name}-#{server_for_branch}"
  end
end

if deployable?
  HerokuHeadless.configure do | config |
    config.post_deploy_commands = ['rake db:migrate']
  end
  HerokuHeadless::Deployer.deploy(derive_server_name('blue-register'))
end
