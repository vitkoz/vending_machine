require 'console_interface'

describe 'Console Interface' do
  it 'returns single hastag' do
    expect(hashtags('words with #tags')).to eq %w(#tags)
  end
end
