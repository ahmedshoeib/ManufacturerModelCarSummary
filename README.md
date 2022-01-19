

Coding test


Dear Candidate,

Since on-site interviews are one of the worst places to test coding skills of a candidate, we 
created this little challenge for you to show off a little. Please create a native iOS app with the 
following characteristics.

Here is the story:

•  As a user, I want to be able to select a car, choosing a unique combination of manufacturer and 
model, and see a summary at the end. Each list will be provided through a web service.

Technical remarks:
•  Implementation in Swift.
•  It should be implemented as two screens (manufacturer, model) with table views. When user 
selects row it goes to the next screen. When user selects row on the last screen please show simple 
alert message with values selected on the previous screens (e.g.
„<manufacturer>, <modeI>“).
•  Please use custom cells. Even rows should have a different background color than odd
rOwS.
•  As the web services can return a really long list of manufacturers and models, we would like to 
see some pagination in the list. Page size: 15 elements.
•  Use of third-party libraries is allowed, but don't abuse it. With great power comes great 
responsibility.

API usage
The base URL is http'//api-aws-eu-qa-1 auto1-test com. In order to use the web services, you must 
use the following key as a parameter in any call: wa_key——coding-puzzle-client-449cc9d. All 
endpoints are accessible using GET.

The web services are the following:

1. v1/car-types/manufacturer Parameters:
•  page
•  pagesize Example:
•  http://api-aws-eu-qa-1.auto1-test.com/v1/car-types/manufacturer?page=0&pageS ize=10&wa 
key=coding-puzzle-client-449cc9d



Response example:

"page": 0,
"pagesize": 15,
"totalPageCount": 4,
"wkda": {
"107": "Bentley"})

2. v1/car-types/main-types Parameters:
•  manufacturer
•  page
•  pagesize Example:
•  http://api-aws-eu-qa-1.auto1-test.com/v1/car-types/main-types?manufacturer=10 
7&page=0&pageSize=10&wa key=coding-puzzle-client-449cc9d

And here's a little guidance:
•  We wouldn't ask you to fulfil this challenge if we hadn't done it ourselves. The people looking 
at your code understand the problems we have been asking you to solve and most of us have been 
investing 2-5 hours of effort. We generally would like you to use this as a guideline for your 
effort. But if you're having fun and want to switch to beast mode, we can't hold you, can we?
•  Use of design patterns and a good architecture is highly encouraged. Make Uncle Bob proud!
•  Though it is not mandatory, (we know that time is usually not in our side), it would really make 
our day if you throw in some testing.
•  Since the topic is pretty vast you are totally allowed to put your code to github to brag around 
with it. However, it is important to not publish this document or mention our name whatsoever. If 
you want to reference, use wrappers. Don't write “Auto1”, write “a company”. It also goes for the 
URLs and endpoints :)
•  If you don't want to publish your code, it is 100% acceptable to just .zip it and send it to 
your hiring manager (the person you got this document from).
