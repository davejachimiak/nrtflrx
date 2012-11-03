Given /^I retrieve the user's id and oauth tokens$/ do
  @user_authenticators = Nrtflrx::UserAuthenticators.new(@login_info)
  @user_authenticators.get_request_token
  @user_authenticators.set_authenticators
end

When /^I add Rounders to the user's queue$/ do
  @queue              = Nrtflrx::Queue(@user_authenticators)
  rounders_netflix_id = '17236920'

  @queue.add(rounders_netflix_id)
end

Then /^Rounders should be in the queue$/ do
  titles = @queue.titles

  titles.must_include 'Rounders'
end
