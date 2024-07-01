" Vim syn file
" Language: pseudocode
" Maintainer: Simone Fidanza
" Latest Revision: 2023-07-03 15:33

if exists('b:current_syntax')
  finish
endif


" let &l:conceallevel=1
execute 'lua require("Comment.ft").set("pseudo", {"# %s", "#> %s <#"})'
syntax clear

" REGEXES {{{1
" NOTE: each of the following regex should be used with the very magic flag `\v`
" let snake_case_re = '<\l+(_\l+)*>'
" let pascal_case_re = '<(\u\l+)*>'
" let camel_case_re = '<(\l+\u\l+)*>'
" }}}

" FUNCTION {{{1
syn region @function.block.pseudo start=/\v^function\s<\l+(_\l+)*>\(.*\)\s\-\>\s<(\u\l+)*>$/ end=/endfunction/ keepend

syn keyword @function.delimiters.pseudo function endfunction containedin=@function.block.pseudo
syn keyword @function.break.pseudo      break                containedin=@function.block.pseudo
syn keyword @function.return.pseudo     return               containedin=@function.block.pseudo

syn match   @function.name.pseudo      /\v(function\s)@<=\zs<[a-z][a-z0-9_]*>\ze\(.*\)/ containedin=@function.block.pseudo
syn match   @function.parameter.pseudo /\v\zs<[A-z][a-z0-9_]*>\ze:/                     containedin=@function.block.pseudo

syn match   @function.call.pseudo      /\v\zs<\l+(_\l+)*>\ze\(.*\)/
syn keyword @function.builtin.pseudo   abs acos asin atan ceil cos cosh exit floor fopen fclose fread fwrite log log10 pow print random input sin sinh sqrt strlen tan tanh


hi def link @function.delimiters.pseudo  @keyword
hi def link @function.break.pseudo       @keyword
hi def link @function.return.pseudo      @keyword.return

hi def link @function.name.pseudo        @function
hi def link @function.call.pseudo        @function
hi def link @function.builtin.pseudo     @function.builtin
hi def link @function.parameter.pseudo   @variable.parameter
" }}}

" PROCEDURE {{{1
syn region @procedure.block.pseudo start=/\v^procedure\s<\l+(_\l+)*>\(.*\)\s\-\>\s<(\u\l+)*>$/ end=/endprocedure/ keepend

syn keyword @procedure.delimiters.pseudo procedure endprocedure containedin=@procedure.block.pseudo
syn keyword @procedure.break.pseudo      break                  containedin=@procedure.block.pseudo
syn keyword @procedure.return.pseudo     return                 containedin=@procedure.block.pseudo

syn match   @procedure.name.pseudo      /\v(procedure\s)@<=\zs<[a-z][a-z0-9_]*>\ze\(.*\)/ containedin=@procedure.block.pseudo
syn match   @procedure.parameter.pseudo /\v\zs<[A-z][a-z0-9_]*>\ze:/                      containedin=@procedure.block.pseudo

syn match   @procedure.call.pseudo      /\v\zs<\l+(_\l+)*>\ze\(\)/

hi def link @procedure.delimiters.pseudo  @keyword
hi def link @procedure.break.pseudo       @keyword
hi def link @procedure.return.pseudo      @keyword.return

hi def link @procedure.name.pseudo        @function
hi def link @procedure.call.pseudo        @function
hi def link @procedure.parameter.pseudo   @variable.parameter
" }}}

" BOOLEANS {{{1
syn keyword @boolean.pseudo true false
hi def link @boolean.pseudo @boolean
" }}}

" TYPES {{{1
syn keyword @builtin.types.pseudo String List Int Float Double Array Long Dict ArrayList Bool containedin=@function.block.pseudo
syn match   @type.pseudo          /\v<(\u\l+)*>/

hi def link @builtin.types.pseudo @type.builtin
hi def link @type.pseudo          @type
" }}}

" STRINGS {{{1
syn region @string.pseudo start=+\"+ end=+\"+ keepend

" not working for some reason
syn match @string.escapedQuote.pseudo /\\\"/               containedin=@string.pseudo display
syn match @string.escape.pseudo       /\\[abefnrtv]/       containedin=@string.pseudo display
syn match @string.escape.pseudo       /\\x[0-9A-Fa-f]\{2}/ containedin=@string.pseudo display
syn match @string.escape.pseudo       /\\u[0-9A-Fa-f]\{4}/ containedin=@string.pseudo display
syn match @string.escape.pseudo       /\\U[0-9A-Fa-f]\{8}/ containedin=@string.pseudo display

hi def link @string.pseudo              @string
hi def link @string.escapedQuote.pseudo @string.special
hi def link @string.escape.pseudo       @string.escape
" }}}

" CONDITIONALS {{{1
syn region @keyword.conditionalBlock.pseudo start=/\v^<if>\(.*\)\s<then>$/ end=/endif/

syn keyword @keyword.conditional.pseudo if then else endif containedin=@keyword.conditionalBlock.pseudo

hi def link @keyword.conditional.pseudo @keyword
" }}}

" REPEATS {{{1
syn region @keyword.forLoop.pseudo start=/\v^<for>\s\(.*\)\s<to>\s.*<do>$/ end=/endfor/ contains=@keyword.repeat.pseudo
syn region @keyword.whileLoop.pseudo start=/\v^<while>\s\(.*\)\s<do>$/ end=/endwhile/   contains=@keyword.repeat.pseudo
syn region @keyword.doLoop.pseudo start=/\v^<do>$/ end=/until\s\(.*\)$/                 contains=@keyword.repeat.pseudo

syn keyword @keyword.repeat.pseudo   for endfor while endwhile do until
syn keyword @keyword.operator.pseudo to

hi def link @keyword.repeat.pseudo   @keyword
hi def link @keyword.operator.pseudo @keyword.operator
" }}}

" NUMBERS {{{1
syn match @number.pseudo '\<\d\>'                 display
syn match @number.pseudo '\<[1-9][_0-9]*\d\>'     display
syn match @number.pseudo '\<\d[jJ]\>'             display
syn match @number.pseudo '\<[1-9][_0-9]*\d[jJ]\>' display

syn match @number.float.pseudo '\.\(\.\)\@!\d\%([_0-9]*\d\)\=\%([eE][+-]\=\d\%([_0-9]*\d\)\=\)\=[jJ]\=\>'                     display
syn match @number.float.pseudo '\<\d\%([_0-9]*\d\)\=[eE][+-]\=\d\%([_0-9]*\d\)\=[jJ]\=\>'                                     display
syn match @number.float.pseudo '\<\d\%([_0-9]*\d\)\=\.\(\.\)\@!\d\=\%([_0-9]*\d\)\=\%([eE][+-]\=\d\%([_0-9]*\d\)\=\)\=[jJ]\=' display

hi def link @number.pseudo       @number
hi def link @number.float.pseudo @number.float
" }}}

" DELIMITERS {{{1
syn match @punctuation.delimiter.pseudo #[;:,\.]# display
syn match @punctuation.delimiter.pseudo #[\(\)\[\]\{\}]# display

hi def link @punctuation.delimiter.pseudo @punctuation.delimiter
" }}}

" OPERATORS {{{1
" Arithmetic {{{2
syn match @operator.pseudo #[\+\-\*\/\%]# display
" }}}

" Comparison/relational {{{2
syn match @operator.pseudo #==#   display
syn match @operator.pseudo #!=#   display
syn match @operator.pseudo #[><]# display
syn match @operator.pseudo #>=#   display
syn match @operator.pseudo #<=#   display
" }}}

" Logical {{{2
syn match @operator.pseudo #!#  display
syn match @operator.pseudo #&&# display
syn match @operator.pseudo #||# display
" }}}

" Bitwise {{{2
syn match @operator.pseudo #[~&|\^]# display
syn match @operator.pseudo #<<#      display
syn match @operator.pseudo #>>#      display
" }}}

" Assignment {{{2
syn match @operator.pseudo #:=#                    display
syn match @operator.pseudo #[\:\+\-\*\\/\%\&|\^]=# display
syn match @operator.pseudo #<<=#                   display
syn match @operator.pseudo #>>=#                   display
" }}}

syn match @operator.pseudo #-># display
syn match @operator.pseudo #\.\.# display

hi def link @operator.pseudo @operator
" }}}

" COMMMENTS {{{1
syn match   @comment.pseudo '#.*$' display
syn region  @comment.pseudo start='#>' end='<#' display keepend

hi def link @comment.pseudo @comment
" }}}

" EXCEPTIONS {{{1
syn region @exception.pseudo start=#try\:# end=#endtry#

syn keyword @keyword.exception.pseudo try catch raise endtry containedin=@exception.pseudo

hi def link @keyword.exception.pseudo @keyword.exception
" }}}

" VARIABLES/ATTRIBUTES/MACRO {{{1
syn keyword @lsp.type.macro.pseudo NULL

syn match @constant.pseudo  /\v<([A-Z0-9_])([A-Z][A-Z0-9_]*)>/
syn match @variable.private.pseudo /\v<__(\l+(_\l+)*)>/

syn keyword @attribute.pseudo length

hi def link @lsp.type.macro.pseudo @lsp.type.macro
hi def link @variable.private.pseudo @markup.italic
hi def link @attribute.pseudo @attribute
" }}}

let b:current_syntax = 'pseudo'
