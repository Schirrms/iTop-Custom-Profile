# 'tests' folder

While not directly related to the iTop `schirrms-custom-profile` extension, I plan to put in this folder some test tools to validate an API connection to iTop.

As I'm working on Linux system, I'll try to put very basic tests to run in a shell environment.

I'll basically try to get the list of Organization, as this should be very light in most environments.

To run those tests, all my (future) scripts needs at least an URL and a token

So, before running any tests in this folder, put the itop url in ITOP_URL and the test TOKEN in ITOP_TOKEN

As in:

~~~bash
export ITOP_URL='http://127.0.0.1/'
export ITOP_TOKEN='{a very long string of at least 112 chars}'
~~~

Note that those test programs (one at the time of writing 😉) can (obviously) been used to test PersonalToken and ApplicationToken.

Also, As the test program works on Organization, it is worth to says that the organization list will be the list of allowed organization for this account.
