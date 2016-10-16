# GoodPartner

## Usage

This tool will be used to aggregate job postings,
companies, and contacts for potential Wyncode Hiring Partners

## CompanyFinder

Opts **must** include a `query` key
that can have an array of hashes.

Allowed params for query ->

 - domain
 - name
 - descriptioin
 - and
 - or
 - alexa_rank
 - google_rank
 - alexa_us_rank
 - location
 - city
 - country
 - state
 - anglellist
 - tag
 - crunchbase
 - employees
 - facebook
 - linkedin
 - twitter
 - twitter_followers
 - market_cap
 - ticker
 - raised
 - industry
 - sub_industry
 - sector
 - similar
 - tech
 - type
 - has
 - hasnt

You can also pass optional params ->
 - page
 - page_size
 - limit
 - sort

Sort options ->
 - score
 - alexa_rank
 - employees
 - google_rank
 - market_cap
 - raised twitter_followers
