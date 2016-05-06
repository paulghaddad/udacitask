require "./user"

describe User do
  it "has a name" do
    name = "Paul"

    user = User.new(name)

    expect(user.name).to eq("Paul")
  end
end
