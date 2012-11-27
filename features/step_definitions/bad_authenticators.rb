Given /^a bad working key$/ do
  Nrtflrx.consumer_key = 'yup, just a bad consumer key'
end

Given /^a bad shared secret$/ do
  Nrtflrx.shared_secret = 'such a bad shared secret'
end

Then /^the response is a bad consumer key exception object$/ do
  @request.must_raise Nrtflrx::BadConsumerKeyError
end

Then /^the response is a bad request error$/ do
  @request.must_raise Nrtflrx::BadRequestError
end
