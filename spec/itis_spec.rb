require 'spec_helper'

describe Itis do 

	it "should return some results if you do query" do
		out = Itis.new.search("Oto Brglez")
		out.should_not be_nil
		out.should be_an_instance_of(Array)
		out.size.should == 1

		out.first.to_s.should =~ /Oto/i
		out.first.url.should =~ /person/i
		out.first.should be_person
	end

	it "should do some searches with more results" do
		out = Itis.search("Janez Novak")
		out.size.should_not == 0
		out.first.should_not be_person
	end

	it "has the ability to do contact lookup" do
		out = Itis.new.search("Oto Brglez").first
		out.should_not be_nil
		out.phones.size.should == 2
	end

end