# GoodPartner

## Usage

This tool will be used to aggregate job postings,
companies, and contacts for potential Wyncode Hiring Partners

## PersonFinder

```ruby
c = Company.first
GoodPartner::PersonFinder.new(c, opts)
```

`opts` **must** include a `domain` key, you can get the value from `company.url` or `company.body['url']`

_Suggested_ Optional params ->
 - role:      [ceo, communications, consulting, customer_service, education, engineering, finance, founder,
               health_professional, human_resources, information_technology, legal, marketing, operations,
               owner, president, product, public_relations, real_estate, recruiting, research, sales]

 - seniority: [executive, director, manager]
 
 - limit: default is 5, max is 20

## CompanyFinder

`opts` **must** include a `query` key
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
