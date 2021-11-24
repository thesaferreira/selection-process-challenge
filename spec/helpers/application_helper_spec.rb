require "rails_helper"

RSpec.describe ApplicationHelper do
    describe "active class" do
        it "returns true" do
            expect(helper.active_class('nopath')).to be_empty
        end 
    end
end