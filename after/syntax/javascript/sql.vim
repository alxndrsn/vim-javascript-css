" Vim plugin
" Language: JavaScript
" Maintainer: alxndrsn

if exists('b:current_syntax')
  let s:current_syntax = b:current_syntax
  unlet b:current_syntax
endif

exec 'syntax include @CSSSyntax syntax/css.vim'
if exists('s:current_syntax')
  let b:current_syntax = s:current_syntax
endif

syntax region cssTemplateString start=+`+ skip=+\\\(`\|$\)+ end=+`+ contains=@CSSSyntax,jsTemplateExpression,jsSpecial extend
exec 'syntax match cssTaggedTemplate +\%(CSS\)\%(`\)\@=+ nextgroup=cssTemplateString'

hi def link cssTemplateString jsTemplateString
hi def link cssTaggedTemplate jsTaggedTemplate

syn cluster jsExpression add=cssTaggedTemplate
syn cluster cssTaggedTemplate add=cssTemplateString
