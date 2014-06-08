require 'spec_helper'

describe 'pear_shaped.vim' do
  it 'sets g:pear_shaped_directory to ~/.pear_shaped by default' do
    default_directory = vim.echo('g:pear_shaped_directory')

    expect(default_directory).to eq '~/.pear_shaped'
  end

  context 'when switching to a new user' do
    it 'clears all mappings' do
      vim.command 'nnoremap x :echo "Hello"'

      vim.command 'PearShaped some_random_person'

      expect(vim).to have_no_mapping_from('x')
    end

    it 'resets all options to their defaults' do
      vim.set 'cursorcolumn'

      vim.command 'PearShaped some_random_person'

      expect(set?('cursorcolumn')).to be false
    end

    it 'sources a vimrc' do
      use_custom_directory

      vim.command 'PearShaped cursorcolumn_user'

      expect(set?('cursorcolumn')).to be true
    end

    it 'correctly sets options when going from one vimrc to another' do
      use_custom_directory

      vim.command 'PearShaped cursorcolumn_user'
      vim.command 'PearShaped expandtab_user'

      expect(set?('cursorcolumn')).to be false
      expect(set?('expandtab')).to be true
    end
  end

  def set?(option)
    vim.echo("&#{option}") == '1'
  end


  def use_custom_directory
    vim.command "let g:pear_shaped_directory = '#{ROOT}/spec/fixtures'"
  end
end
