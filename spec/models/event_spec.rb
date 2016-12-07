require 'rails_helper'

RSpec.describe Event do
  # before(:each)do
    @user = User.create(name: "Daniel", email: "danthwa@gmail.com", age: 26)
  # end
  it "can create an event with valid attributes" do
    Event.create(title:"Dojo Orientation", location:"Coding Dojo", user: @user)
    expect(Event.where(title: "Dojo Orientation")).to exist
  end
  it "throws error when supplied invalid attributes" do
    @event = Event.new()
    expect(@event.valid?).to eq(false)
  end
end
