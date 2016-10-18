class IndeedScraper < GoodPartner::Scraper
  attr_reader :url

  def self.call
    new("http://www.indeed.com/").scrape
  end

  def initialize(url)
    @url = URI(url)
  end

  def scrape
    find_and_fill_form limit: 20

    close_popup

    visit_each_job
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
      save_and_open_page
      find_all('.row.result').each do |result|
        within(result) do
          find('.jobtitle').click
          save_job_info
        end
      end
    end

    if page.has_css?('.np')
      find_all('.np').last.click
      visit_each_job
    end

  end

  def save_job_info
    title = find('.jobtitle').text
    company_name = find('.company').text if page.has_css?('.company')
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

  def close_popup
    find('#prime-popover-close-button', match: :first).click if page.has_css?('#prime-popover-close-button')
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
