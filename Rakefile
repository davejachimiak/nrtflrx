task default: [:test]

task :test do
  system 'turn spec'
end

namespace :test do
  task :nrtflrx do
    system 'turn spec/nrtflrx_spec.rb'
  end

  task :queue do
    system 'turn spec/nrtflrx/queue_spec.rb'
  end

  task :oauth_login_request do
    system 'turn spec/nrtflrx/oauth_login_request_spec.rb'
  end

  task :oauth_login_params do
    system 'turn spec/nrtflrx/oauth_login_request/params_spec.rb'
  end

  task :request_token do
    system 'turn spec/nrtflrx/request_token_spec.rb'
  end

  task :request do
    system 'turn spec/nrtflrx/request_spec.rb'
  end

  task :params do
    system 'turn spec/nrtflrx/request/params_spec.rb'
  end

  task :signature do
    system 'turn spec/nrtflrx/request/params/signature_spec.rb'
  end
end

