require 'spec_helper'

describe Page do
  before(:each) do
    @page = build(:page)
  end
  
  context "positive results" do
    it "expects a page to have a name" do
      expect(@page.name).to eq 'Home'
    end
    it "expects a page to have content" do
      expect(@page.content).to eq 'Dit is de homepage'
    end
    it "expects a page to have a permalink" do
      expect(@page.permalink).to eq 'home'
    end
  end
  
  context "negative results" do
    it "is invalid without a name" do
      @page = build(:page, name: nil)
      expect(@page).to have(1).errors_on(:name)
    end
    it "is invalid without content" do
      @page = build(:page, content: nil)
      expect(@page).to have(1).errors_on(:content)
    end
    it "is invalid without a permalink" do
      @page = build(:page, permalink: nil)
      expect(@page).to have(1).errors_on(:permalink)
    end
  end
end