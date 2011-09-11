# It's all gone pear-shaped!

## How to use
Let's say you're gabebw, and you're pairing with ben. Do this:

Copy your vimrc's to "~/.pearshaped/gabebw-vimrc" and ~/.pearshaped/ben-vimrc".

In vim:

    :call g:PearAdd("gabebw")
    :call g:PearAdd("ben")

Every time you want to swap vimrc's, do this:

    :call g:PearSwap()

## WARNING

Fair warning: MVP, may break things, not every elegant, full of Vimscript.

### Author

Gabe Berke-Williams, 2011. Fueled by azuki cream pastries, thai iced tea, and
(regarding vimscript) loathing.
