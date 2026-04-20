if vim.b.current_syntax then
	return
end

if not vim.g.main_syntax then
	vim.g.main_syntax = "yaml"
end

vim.b.current_syntax = nil
vim.cmd.runtime("syntax/yaml.vim")

vim.b.current_syntax = nil
vim.cmd("syntax include @Yaml syntax/yaml.vim")

vim.cmd("syn case match")

local syn = function(cmd)
	vim.cmd("syn " .. cmd)
end

local hi_link = function(from, to)
	vim.api.nvim_set_hl(0, from, { link = to, default = true })
end

syn([[match goEscapeOctal display contained "\\[0-7]\{3}"]])
syn([[match goEscapeC display contained +\\[abfnrtv\\'"]+]])
syn([[match goEscapeX display contained "\\x\x\{2}"]])
syn([[match goEscapeU display contained "\\u\x\{4}"]])
syn([[match goEscapeBigU display contained "\\U\x\{8}"]])
syn([[match goEscapeError display contained +\\[^0-7xuUabfnrtv\\'"]+]])

hi_link("goEscapeOctal", "goSpecialString")
hi_link("goEscapeC", "goSpecialString")
hi_link("goEscapeX", "goSpecialString")
hi_link("goEscapeU", "goSpecialString")
hi_link("goEscapeBigU", "goSpecialString")
hi_link("goSpecialString", "Special")
hi_link("goEscapeError", "Error")

syn("cluster goStringGroup contains=goEscapeOctal,goEscapeC,goEscapeX,goEscapeU,goEscapeBigU,goEscapeError")
syn([[region goString contained start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=@goStringGroup]])
syn([[region goRawString contained start=+`+ end=+`+]])

hi_link("goString", "String")
hi_link("goRawString", "String")

syn("cluster goCharacterGroup contains=goEscapeOctal,goEscapeC,goEscapeX,goEscapeU,goEscapeBigU")
syn([[region goCharacter contained start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=@goCharacterGroup]])

hi_link("goCharacter", "Character")

syn([[match goDecimalInt contained "\<\d\+\([Ee]\d\+\)\?\>"]])
syn([[match goHexadecimalInt contained "\<0x\x\+\>"]])
syn([[match goOctalInt contained "\<0\o\+\>"]])
syn([[match goOctalError contained "\<0\o*[89]\d*\>"]])
syn("cluster goInt contains=goDecimalInt,goHexadecimalInt,goOctalInt")

syn([[match goFloat contained "\<\d\+\.\d*\([Ee][-+]\d\+\)\?\>"]])
syn([[match goFloat contained "\<\.\d\+\([Ee][-+]\d\+\)\?\>"]])
syn([[match goFloat contained "\<\d\+[Ee][-+]\d\+\>"]])

syn([[match goImaginary contained "\<\d\+i\>"]])
syn([[match goImaginary contained "\<\d\+\.\d*\([Ee][-+]\d\+\)\?i\>"]])
syn([[match goImaginary contained "\<\.\d\+\([Ee][-+]\d\+\)\?i\>"]])
syn([[match goImaginary contained "\<\d\+[Ee][-+]\d\+i\>"]])

hi_link("goInt", "Number")
hi_link("goFloat", "Number")
hi_link("goImaginary", "Number")

syn("cluster gotplLiteral contains=goString,goRawString,goCharacter,@goInt,goFloat,goImaginary")
syn("keyword gotplControl contained if else end range with template include tpl required define")
syn(
	"keyword gotplFunctions contained and call html index js len not or print printf println urlquery eq ne lt le gt ge"
)

syn(table.concat({
	"keyword goSprigFunctions contained",
	"abbrev abbrevboth add add1 adler32sum ago append atoi",
	"b32dec b32enc b64dec b64enc base biggest buildCustomCert bcrypt",
	"camelcase cat ceil clean coalesce \\contains compact chunk",
	"date dateInZone dateModify date_in_zone date_modify default derivePassword dict dir div dig deepCopy decryptAES encryptAES",
	"env expandenv empty ext fail first float64 floor fromJson fromYaml",
	"genCA genCAWithKey genPrivateKey genSelfSignedCert genSelfSignedCertWithKey genSignedCert genSignedCertWithKey",
	"getHostByName has hasKey hasPrefix hasSuffix hello htmlDate htmlDateInZone htpasswd",
	"indent initial initials int int64 isAbs join kebabcase keys kindIs kindOf",
	"last list lower max merge mergeOverwrite min mod mul",
	"nindent nospace now omit pick pluck plural prepend quote",
	"randAlpha randAlphaNum randAscii randNumeric randBytes",
	"regexFind regexFindAll regexMatch regexReplaceAll regexReplaceAllLiteral regexSplit",
	"repeat replace rest reverse round semver semverCompare",
	"set sha1sum sha256sum shuffle slice snakecase sortAlpha split splitList splitn squote",
	"sub substr swapcase ternary title toDate toJson toPrettyJson toString toStrings toToml toYaml",
	"trim trimAll trimPrefix trimSuffix trimall trunc tuple typeIs typeIsLike typeOf",
	"uniq unixEpoch unset until untilStep untitle upper uuidv4 values without wrap wrapWith",
}, " "))

syn([[match gotplVariable contained /\$[a-zA-Z0-9_]*\>/]])
syn([[match goTplIdentifier contained /\.[^\s}]+\>/]])

hi_link("gotplControl", "Keyword")
hi_link("gotplFunctions", "Function")
hi_link("goSprigFunctions", "Function")
hi_link("gotplVariable", "Special")

syn(
	[[region gotplAction start="{{\(-\? \)\?" end="\( -\?\)\?}}" contains=@gotplLiteral,gotplControl,gotplFunctions,goSprigFunctions,gotplVariable,goTplIdentifier containedin=yamlFlowString display]]
)
syn(
	[[region gotplAction start="\[\[\(-\? \)\?" end="\( -\?\)\?\]\]" contains=@gotplLiteral,gotplControl,gotplFunctions,goSprigFunctions,gotplVariable containedin=yamlFlowString display]]
)
syn([[region goTplComment start="{{\(-\? \)\?/\*" end="\*/\( -\?\)\?}}" display]])
syn([[region goTplComment start="\[\[\(-\? \)\?/\*" end="\*/\( -\?\)\?\]\]" display]])

hi_link("gotplAction", "PreProc")
hi_link("goTplComment", "Comment")

vim.b.current_syntax = "helm"
