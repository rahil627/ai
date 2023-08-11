#!/usr/bin/ruby
require 'open-uri'
require 'nokogiri'

url = "https://careerspub.universityofcalifornia.edu/psp/ucb/EMPLOYEE/HRMS/c/HRS_HRAM.HRS_APP_SCHJOB.GBL?Page=HRS_APP_SCHJOB&Action=U&FOCUS=Applicant&SiteId=21"

begin
  html = URI.open(url)
  doc = Nokogiri::HTML(html)
  
  job_listings = doc.css('.PSLEVEL3GRIDNBO a.PSHYPERLINK')
  
  job_listings.each do |job_listing|
    title = job_listing.text
    link = job_listing['href']
    puts "Title: #{title}"
    puts "Link: #{link}"
    puts "-" * 50
  end
rescue StandardError => e
  puts "An error occurred: #{e.message}"
end
