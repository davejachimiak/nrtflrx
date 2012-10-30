When /^I add Rounders to the user's queue$/ do
  rounders_netflix_id = '17236920'
  @queue              = Nrtflrx::Queue.add(@login, rounders_netflix_id)
end
