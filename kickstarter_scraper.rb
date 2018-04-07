require 'pry'
require 'nokogiri'



def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  
  projects = {}
  
  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = project
  end
  
  projects
end


create_project_hash

#projects: kickstarter.css("li.project.grid_4")
#title: project.css("h2.bbcard_name strong a").text
#image link: project.css("div.project-thumbnail a img").attribute("src").
#text: project.css("p.bbcard_blurb").text
#project.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i
# location: project.css("ul.project-meta span.location-name").text