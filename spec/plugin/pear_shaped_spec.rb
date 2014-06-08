require 'spec_helper'

describe 'pear_shaped.vim' do
  it 'sets g:pear_shaped_directory to ~/.pear_shaped by default' do
    default_directory = vim.echo('g:pear_shaped_directory')

    expect(default_directory).to eq '~/.pear_shaped'
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

    it 'sources a vimrc' do
      vim.command "let g:pear_shaped_directory = '#{ROOT}/spec/fixtures'"

      vim.command 'PearShaped "gabe"'

      expect(set?('cursorcolumn')).to be true
    end
  end

  def set?(option)
    vim.echo('&cursorcolumn') == '1'
  end
end
