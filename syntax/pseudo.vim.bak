" Vim syntax file
" Language: pseudocode
" Maintainer: Simone Fidanza
" Latest Revision: 2023-07-03 15:33

if exists("b:current_syntax")
  finish
endif


" ----------------------------------------------------------------------------
" BUFFER SPECIFIC OPTIONS
" ----------------------------------------------------------------------------
let &l:conceallevel=1
execute 'lua require("Comment.ft").set("pseudo", {"//%s", "/*%s*/"})'
syntax clear

syntax keyword pcodeInclude          vedere
syntax keyword pcodeKeywords         FUNZIONE INPUT OUTPUT LAVORO ALGORITMO
syntax keyword pcodeBooleans         TRUE FALSE
syntax keyword pcodeConditionals     SE ALLORA ALTRIMENTI
syntax keyword pcodeRepeats          MENTRE ESEGUI FINCHÉ
syntax keyword pcodeTypes            intero reale decimale stringa carattere array
syntax keyword pcodeNumbersWords     zero uno due tre quattro cinque sei sette
                                   \ otto nove dieci
syntax keyword pcodeBuiltinFunctions StampareAVideo LeggereDaTastiera AprireFile
                                   \ ChiudereFile LeggereDaFile ScrivereSuFile
                                   \ Uscire


syntax match pcodeDelimiters     /[,;()\[\]{}]/
syntax match pcodeDocumentTitle  /\%^[A-Z][A-Z ]*$/
syntax match pcodeHeader         /^=\+$/
syntax match pcodeConstants      /\v(%^[A-Z][A-Z ]*)@!<[A-Z][A-Z_]*>/
syntax match pcodeNumbers        /\v(<\d+>|<[-+]\d+>)/
syntax match pcodeFloats         /\v(<\d+\.\d*>|<[-+]\d+\.\d*>)/
syntax match pcodeIncludePath    /\v"(\.|\.\.)\/([^"]+\.[^"]+)"/ containedin=pcodeString
syntax match pcodeHorizontalRule /^-\+$/
syntax match pcodeFunctionCall   /\v<[a-z][a-z0-9_]*>(\((|.*)\))@=/
syntax match pcodeInlineComment  #//.*$#
syntax match pcodeString         /\v(\w)@<!"[^"]"/
syntax match pcodeString         /\v(\w)@<!'[^']'/
syntax match pcodeRegexString    /r"[^"]"/
syntax match pcodeCharacter      /\w\@<!'\w'/
syntax match pcodeEscapeSequence /\v(\\\w+|\\\d+)/ containedin=pcodeString


syn match pcodeRepeatsEnd
  \ /\v^(|\s+)<FINE>\s(<SE>)@!<(MENTRE|ESEGUI)>(|\s+)$/
syn match pcodeConditionalsEnd
  \ /\v^(|\s+)<FINE>\s(<MENTRE>|<ESEGUI>)@!<SE>(|\s+)$/

syntax match pcodeParameterName
  \ /\v^-\s\zs<[a-z][a-z0-9_]*>\ze,/
syntax match pcodeParameterDescription
  \ /\v(^-\s<[a-z][a-z0-9_]*>,\s)@<=(.*|.*\n\s{2}.*)\ze,/
syntax match pcodeParameterType
  \ /\v(^-\s<[a-z][a-z0-9_]*>,\s(.*|.*\n\s{2}.*)\ze,)@<=\s<\k+>/

syntax region pcodeCommentBlock
  \ start=:/\*:
  \ end=  :\*/:


syntax match pcodeLogicalNot /\v<NOT\s|NOT>/ conceal cchar=¬
syntax match pcodeLogicalAnd /\<AND\>/       conceal cchar=&
syntax match pcodeLogicalOr  /\<OR\>/        conceal cchar=∥

syntax match pcodeGreater      /maggiore di /         conceal cchar=󰥭
syntax match pcodeGreaterEqual /maggiore o uguale a / conceal cchar=󰥮
syntax match pcodeLesser       /minore di /           conceal cchar=󰥼
syntax match pcodeLesserThan   /minore o uguale a /   conceal cchar=󰥽

syntax match pcodePositive / positivo/ conceal cchar=󰐕
syntax match pcodeNegative / negativo/ conceal cchar=󰍴

syntax match pcodePlusEquals   conceal cchar=+
  \ #\v^(|\s+)(<[a-z][a-z0-9_]*>) :\zs\= \2 \+#
syntax match pcodeMinusEquals  conceal cchar=-
  \ #\v^(|\s+)(<[a-z][a-z0-9_]*>) :\zs\= \2 \-#
syntax match pcodeTimesEquals  conceal cchar=*
  \ #\v^(|\s+)(<[a-z][a-z0-9_]*>) :\zs\= \2 \*#
syntax match pcodeDivideEquals conceal cchar=/
  \ #\v^(|\s+)(<[a-z][a-z0-9_]*>) :\zs\= \2 \/#

" highlight def IncludePath 
execute 'highlight IncludePath cterm=underline gui=underline ' .
  \ 'guifg=' . synIDattr(synIDtrans(hlID('String')), 'fg', 'gui')

highlight link pcodeInclude            Include
highlight link pcodeKeywords           Special
highlight link pcodeBooleans           Boolean
highlight link pcodeConditionals       Conditional
highlight link pcodeRepeats            Repeat
highlight link pcodeTypes              Type
highlight link pcodeNumbersWords       Number
highlight link pcodeBuiltinFunctions   Function

highlight link pcodeDelimiters           Delimiter
highlight link pcodeDocumentTitle        Bold
highlight link pcodeHeader               Title
highlight link pcodeConstants            Constant
highlight link pcodeNumbers              Number
highlight link pcodeFloats               Float
highlight link pcodeIncludePath          IncludePath
highlight link pcodeHorizontalRule       Comment
highlight link pcodeFunctionCall         Function
highlight link pcodeInlineComment        Comment
highlight link pcodeRepeatsEnd           Repeat
highlight link pcodeConditionalsEnd      Conditional
highlight link pcodeParameterName        Underlined
highlight link pcodeParameterDescription Italic
highlight link pcodeParameterType        Type
highlight link pcodeString               String
highlight link pcodeRegexString          Special
highlight link pcodeCharacter            Character
highlight link pcodeEscapeSequence       Special
highlight link pcodeCommentBlock         Comment
