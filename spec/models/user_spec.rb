RSpec.describe User, type: :model do
  it 'is valid with a name' do
    user = build(:user)
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = build(:user, name: nil)
    expect(user).not_to be_valid
  end

  it 'is not valid with negative posts counter' do
    user = build(:user, posts_counter: -1)
    expect(user).not_to be_valid
  end
end
