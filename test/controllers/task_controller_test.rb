require 'test_helper'

class TaskControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  before(:each) do
  end


  it 'should display Appointments of Current User' do
    get :index,  format: 'json'
    expect(response.staus).to eq 200
  end
end
