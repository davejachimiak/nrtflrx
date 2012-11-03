When /^I submit a catalog request$/ do
  @request = Nrtflrx.catalog
end

Then /^I successfully receive a catalog in xml format$/ do
  @request.must_include 'catalog/titles/movies'
end
