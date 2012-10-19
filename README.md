# Patient List

Patient List is a open source application that allows doctors to easily hand patients over to the night/weekend shift in an NHS hospital.  It was the winning application at the first NHS hack day.

* http://www.ehi.co.uk/news/ehi/7777/handover-system-wins-nhs-hack-day
* http://www.computerweekly.com/news/2240160016/NHS-Hack-Day-winners-claim-app-will-save-3m
* http://www.bmj.com/content/345/bmj.e5162?ath_user=nhsreadj&ath_ttok=%3CUBZOuKNp69nMxsA2Jw%3E

Patient List is in the process of being developed into an application that NHS trusts can easily download and install.

For more information about the system, please see [our wiki](https://github.com/edgecase/nhs-patientlist/wiki/Patient-List-Wiki).

[![Build Status](https://secure.travis-ci.org/edgecase/nhs-patientlist.png)](http://travis-ci.org/edgecase/nhs-patientlist)


## Testing

Travis CI currently runs the unit tests ONLY - https://travis-ci.org/#!/edgecase/nhs-patientlist

To invoke the full test suite, run `rake` or `rspec spec`

The test suite partially makes use of phantomJS to run capybara tests via headless webkit - http://phantomjs.org
