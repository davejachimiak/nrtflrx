When /^I add Rounders to the user's queue$/ do
  @queue = Nrtflrx::Queue(@login_credentials)
  rounders_netflix_id = '17236920'

  @queue.add(rounders_netflix_id)
end

Then /^Rounders should be in the queue$/ do
  titles = @queue.titles

  titles.must_include 'Rounders'
end
