When /^I submit an instant catalog request$/ do
  @request = Nrtflrx.instant_catalog
end

Then /^I successfully receive a catalog in xml format$/ do
  @request.must_include 'catalog/titles/movies'
end

