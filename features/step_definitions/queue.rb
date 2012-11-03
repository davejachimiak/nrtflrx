Given /^I retrieve the user's id and oauth tokens$/ do
  @user         = Nrtflrx::User.new(login_credentials)
  request_token = Nrtflrx.request_token

  @user.set_authenticators(request_token)
end

When /^I add Rounders to the user's queue$/ do
  @queue              = @user.queue
  rounders_netflix_id = '17236920'

  @queue.add(rounders_netflix_id)
end

Then /^Rounders should be in the queue$/ do
  titles = @queue.titles

  titles.must_include 'Rounders'
end
