require 'spec_helper'

describe 'pearshaped.vim' do
  it 'sets g:pearshaped_directory to ~/.pearshaped by default' do
    default_directory = vim.echo('g:pearshaped_directory')

    expect(default_directory).to eq '~/.pearshaped'
  end

  context 'when switching to a new user' do
    it 'clears all mappings' do
      vim.command 'nnoremap x :echo "Hello"'

      vim.command 'PearShaped "gabe"'

      expect(vim).to have_no_mapping_from('x')
    end

    it 'resets all options to their defaults' do
      vim.set 'cursorcolumn'

      vim.command 'PearShaped "gabe"'

      expect(set?('cursorcolumn')).to be false
    end

    it 'sources a vimrc if it is available' do
      vim.command "let g:pearshaped_directory = '#{ROOT}/spec/fixtures'"

      vim.command 'PearShaped gabe'

      expect(set?('cursorcolumn')).to be true
    end
  end

  def set?(option)
    vim.echo('&cursorcolumn') == '1'
  end
end
