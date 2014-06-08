# It's all gone pear-shaped [![Build Status](https://travis-ci.org/gabebw/pear-shaped.svg?branch=master)](https://travis-ci.org/gabebw/pear-shaped)

Easily switch between your vim configuration and your pair's vim configuration.

## How to use
Let's say you're gabe, and you're pairing with ben.

First, copy both of your dotfiles to `~/.pear_shaped/gabe` and
`~/.pear_shaped/ben`, respectively. Make sure there's a `vimrc` file in both
directories, and that you can `:source` them.

In vim:

```vim
:Pearshaped "ben"
```

Now you're using ben's vim configuration. To switch back to gabe:

```vim
:Pearshaped "gabe"
```

Neat-o.

## OK, what does it actually do?

This plugin will, in order:

* Clear all mappings
* Reset every option (set with `:set`) back to its default
* Source the desired vimrc

## Configuration

If you want to put your configuration files somewhere other than
`~/.pear_shaped`, you can change it:

```vim
:let g:pear_shaped_directory = "~/.vim/pear_shaped"
```

## Running the plugin's tests

    rake

If you get errors on OSX about `Vimrunner`, try installing MacVim then re-running the specs:

    $ brew install macvim

### Author

Gabe Berke-Williams, 2011-present. Fueled by azuki cream pastries, thai iced
tea, and (regarding vimscript) loathing.
