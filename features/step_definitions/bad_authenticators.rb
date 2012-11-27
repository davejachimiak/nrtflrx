Given /^a bad working key$/ do
  Nrtflrx.consumer_key = 'yup, just a bad consumer key'
end

Then /^the response is a bad consumer key exception object$/ do
  @request.must_be_kind_of Nrtflrx::BadConsumerKeyError
end
