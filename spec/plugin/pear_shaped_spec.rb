require 'spec_helper'

describe 'pear_shaped.vim' do
  it 'sets g:pear_shaped_directory to ~/.pear_shaped by default' do
    with_clean_vim do |clean_vim|
      default_directory = clean_vim.echo('g:pear_shaped_directory')

      expect(default_directory).to eq '~/.pear_shaped'
    end
  end

  context 'when switching to a new user' do
    it 'clears all mappings' do
      with_clean_vim do |clean_vim|
        clean_vim.command 'nnoremap x :echo "Hello"'

        clean_vim.command 'PearShaped gabe'

        expect(clean_vim).to have_no_mapping_from('x')
      end
    end

    it 'resets all options to their defaults' do
      with_clean_vim do |clean_vim|
        clean_vim.set 'cursorcolumn'

        clean_vim.command 'PearShaped gabe'

        expect(set?(clean_vim, 'cursorcolumn')).to be false
      end
    end

    it 'sources a vimrc' do
      with_clean_vim do |clean_vim|
        clean_vim.command "let g:pear_shaped_directory = '#{ROOT}/spec/fixtures'"

        clean_vim.command 'PearShaped gabe'

        expect(set?(clean_vim, 'cursorcolumn')).to be true
      end
    end
  end

  def set?(vim_instance, option)
    vim_instance.echo('&cursorcolumn') == '1'
  end

  def with_clean_vim
    clean_vim = Vimrunner.start
    clean_vim.add_plugin(File.join(ROOT, 'plugin'), 'pear_shaped.vim')
    yield(clean_vim)
  ensure
    clean_vim.kill
  end
end
