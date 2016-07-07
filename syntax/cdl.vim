" Vim syntax file
" Language: netCDF Common Data Format
" Maintainer: Luke Campbell
" Latest Revision: 2016-06-09

if exists("b:current_syntax")
  finish
endif

syn keyword cdfTypes char byte ubyte short ushort int long uint int64 uint64 float double
syn match cdfKeywords /\cnetcdf/
syn match cdfKeywords /\cdimensions/
syn match cdfKeywords /\cvariables/
syn match cdfKeywords /\cdata/
syn match cdfComments "//.*$"
syn region  cdfStrings start=+"+ skip=+\\\\\|\\"+ end=+"+

hi def link cdfTypes Type
hi def link cdfKeywords Statement
hi def link cdfComments Comment
hi def link cdfStrings String

let b:current_syntax = "cdl"

