if !exists("main_syntax")
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'weechatlog'
endif

syntax clear

syn match WeeChatNick         '\t.*\t'
syn match WeeChatJoin         '\t-->\t'
syn match WeeChatPart         '\t<--\t'

syn region WeeChatChannelMsg start=/\t--\t/ end=/\n/ contains=WeeChatChannel

syn match WeeChatDate         '\d\{4}-\d\{2}-\d\{2}'
syn match WeeChatTimestamp    '\d\{2}:\d\{2}:\d\{2}'
syn match WeeChatChannel      '#\S\+'
syn match WeeChatDomain       '(\S*@\S*)'
syn match WeeChatTimeout      '(Ping timeout: \d\+ seconds)'
syn match WeeChatPart         '(Remote host closed the connection)'
syn match WeeChatPart2        '(Quit: .*)'

syn match WeeChatLink /[a-z]\+:\/\/[a-zA-z0-9./?=%]\+/

hi link WeeChatDate Number
hi link WeeChatTimestamp Number

hi link WeeChatChannel PreProc

hi link WeeChatChannelMsg Label
hi link WeeChatDomain Identifier

hi link WeeChatJoin Statement
hi link WeeChatPart  Error
hi link WeeChatPart2 Error
hi link WeeChatTimeout WeeChatPart

hi link WeeChatNick String

hi link WeeChatLink Function
