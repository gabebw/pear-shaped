require 'rspec'
require 'vimrunner'
require 'vimrunner/rspec'

Dir["spec/support/**/*.rb"].each { |f| require File.expand_path(f) }

ROOT = File.expand_path('../..', __FILE__)

Vimrunner::RSpec.configure do |config|
  config.start_vim do
    vim = Vimrunner.start

    vim.add_plugin(File.join(ROOT, 'plugin'), 'pear_shaped.vim')

    vim
  end
end

RSpec.configure do |config|
  config.order = :random
end
