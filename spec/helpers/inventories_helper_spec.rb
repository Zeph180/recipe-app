require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the InventoriesHelper. For example:
#
# describe InventoriesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe InventoriesHelper, type: :helper do
  it 'shoul be a place holder test' do
    expect('hello').to eq('hello')
  end
end
