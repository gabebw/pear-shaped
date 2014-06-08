RSpec::Matchers.define :have_no_mapping_from do |keys|
  match do |current_vim|
    @current_vim = current_vim
    mapped_command(keys).empty?
  end

  failure_message do |current_vim|
    "expected to have no mapping from '#{keys}' but actually mapped to '#{@result}'"
  end

  def mapped_command(keys)
    @result = @current_vim.command "echo maparg('#{keys}')"
  end
end
