require 'spec_helper'

describe 'pearshaped.vim' do
  context 'when switching to a new user' do
    it 'clears all mappings' do
      vim.command 'nnoremap x :echo "Hello"'

      vim.command 'PearShaped("ben")'

      expect(vim).to have_no_mapping_from('x')
    end

    it 'resets all options to their defaults' do
      vim.command 'set cursorcolumn'

      vim.command 'PearShaped("ben")'

      expect(vim.command('echo &cursorcolumn')).to eq '0'
    end
  end
end
