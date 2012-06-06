# -*- encoding: utf-8 -*-

# By Oto Brglez - <oto.brglez@opalab.com>
require "httparty"
require "nokogiri"

class ItisItem
	attr_accessor :text, :description, :url
	
	def initialize element
		@text = element.at("Text").content.strip
		@url = element.at("Url").content.strip
		@description =  element.at("Description").content.strip
		self
	end

	def to_s; @text end
	def person?; (@url =~ /Person/i)? true: false end
	
	def id
		Regexp.last_match[0] if @url.match(/\d+/) and person?
	end

	def phones
		out = HTTParty.get("http://www.itis.si/AAA-AAA?#{id}").parsed_response if person?
	end

	class HTTParty::Parser
		def noko
			doc = Nokogiri::HTML(body)
			doc.remove_namespaces!
			results = doc.css("p.nums span.phone").to_a
			return results.map!{|phone| phone.content } unless results.empty?
			[]
		end
	end
end

class SearchSuggestionParser < HTTParty::Parser
  SupportedFormats.merge!('text/html' => :noko) # Service retursn HTML!
  SupportedFormats.merge!('text/xml' => :noko)

  def noko
    doc = Nokogiri::XML(body)
    doc.remove_namespaces!
    results = doc.xpath("//Item").to_a
    return results.map!{|element| ItisItem.new(element)} unless results.empty?
    []
  end
end

class Itis

	include HTTParty
	base_uri 'www.itis.si'
	parser SearchSuggestionParser

	def search(q)
		self.class.get('/Page_VisualSearch.aspx',:query => {q: q}).parsed_response
	end

	def self.search(q)
		Itis.new.search(q)
	end
end
