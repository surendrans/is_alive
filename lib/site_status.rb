require 'rubygems'
require 'curl'
require 'nokogiri'
require 'yaml'


class SiteStatus

attr_accessor :site_xpath_yaml
attr_accessor :loaded_file
def initialize(yaml_path)

self.site_xpath_yaml = yaml_path
begin
self.loaded_file = YAML.load(File.new(yaml_path))
rescue Errno::ENOENT
self.site_xpath_yaml = nil
end
end

def start_testing
loaded_file.map do |parent, value|
{parent => 
value.map{ |url, xpath|
response = Curl::Easy.perform(url)
    response_html = Nokogiri::HTML(response.body_str)
    response_title = response_html.xpath("//title").first.content
    status = response_html.xpath(xpath).empty? ? "failed" : "passed"
url + response_title + status
} }
end
end

end
#UNECE_CHECK_FILE = YAML.load(File.new("unece.yml"))
#check_for_fail = true
#html = "<html><head><link href='result_page.css' media='screen' rel='stylesheet' type='text/css' /></head><body><h2>Fill the heading</h2>"
#html += "<table class='unece_results' ><tr><th>URL</th><th>Title</th><th>Status</th></tr>"

#html += UNECE_CHECK_FILE.map do |parent, value|
 #"<tr class='parent'><td colspan = 3>" + parent + "</td></tr>" + 
 # value.map{ |url, xpath|
  #  response = Curl::Easy.perform(url)
   # response_html = Nokogiri::HTML(response.body_str)
    #response_title = response_html.xpath("//title").first.content
#status = response_html.xpath(xpath).empty? ? "failed" : "passed"
#check_for_fail = false if response_html.xpath(xpath).empty?
#"<tr><td class=" + status + ">" + url + "</td><td class=" + status + " >" + response_title + "</td><td class=" + status + " >" + status + "</td></tr>"
 # }.join(' ')
#end.join(' ')

#html += "</table></body></html>"
#fileHtml = File.new("result.html", "w+")
#fileHtml.puts html
#fileHtml.close()
#status_email  = check_for_fail ?  "All are passsing, not sending email" : "send email saying something is failing" 
#p status_email

