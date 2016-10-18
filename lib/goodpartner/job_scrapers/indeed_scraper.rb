class IndeedScraper < GoodPartner::Scraper
  # include Capybara::DSL
  attr_reader :url

  def self.call
    new("http://www.indeed.com/").scrape
  end

  def initialize(url)
    @url = URI(url)
  end

  def scrape
    find_and_fill_form limit: 20

    while page.has_css?('.np')
      find('.np', match: :first).click
      visit_each_job
    end
  end

  def find_and_fill_form(opts = {})
    limit = opts[:limit] || 10

    visit url
    find_link('Advanced Job Search').click
    find_field 'as_any'
    fill_in 'as_any', with: skills
    select('within 50 miles of', from: 'radius')
    find_field 'l'
    fill_in 'l', with: 'Miami, FL'
    select(limit, from: 'limit')
    find('#fj', match: :first).click
  end

  def visit_each_job
    within('#resultsCol') do
      find_all('.row.result').each do |result|
        within(result) do
          find('.jobtitle').click
          p 'saving'
          save_job_info
        end
      end
    end
  end

  def save_job_info
    title = find('.jobtitle').text
    company_name = find('.company').text
    description = find('.summary').text

    Job.find_or_create_by(description: description) do |j|
      Company.find_or_create_by(name: company_name) do |c|
        c.name = company_name
        j.company = c
      end

      j.description = description
      j.title = title
    end

  end

  def skills
    %w(
    ruby
    javascript
    rails
    sql
    git
    html
    css
    jquery
    agile
    full-stack
    junior
    jr.
    developer
    )
  end

end
