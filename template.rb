# Gemfile
gem_group :development, :test do
  gem 'better_errors'
  gem 'bullet'
  gem 'rubocop'
  gem 'rails_best_practices'
  gem 'pry-byebug'
  gem 'pry-coolline'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

# install locales
remove_file 'config/locales/en.yml'
run 'wget https://raw.github.com/svenfuchs/rails-i18n/master/rails/locale/en.yml -P config/locales/'
run 'wget https://raw.github.com/svenfuchs/rails-i18n/master/rails/locale/ja.yml -P config/locales/'

# config/application.rb
application do
  %q{
    config.time_zone = 'Asia/Tokyo'
  }
end

create_file '.bundle/config', <<EOS
---
BUNDLE_PATH: "vendor/bundle"
BUNDLE_BIN: "vendor/bundle/bundle_bin"
BUNDLE_DISABLE_SHARED_GEMS: "true"
BUNDLE_JOBS: "4"
BUNDLE_BUILD__NOKOGIRI: "--use-system-libraries"
EOS

# set up rubocop
create_file '.rubocop.yml', <<YAML
AllCops:
  DisplayCopNames: true
  Exclude:
    - vendor/**/*
    - db/**/*
    - tmp/**/*
    - bin/**/*

# Rails

Rails:
  Enabled: true

# Style

Style/AccessModifierIndentation:
  Enabled: true

Style/AccessorMethodName:
  Enabled: true

Style/Alias:
  Enabled: true

Style/AlignArray:
  Enabled: true

Style/AlignHash:
  Enabled: true

Style/AlignParameters:
  Enabled: true

Style/AndOr:
  Enabled: true
  EnforcedStyle: conditionals

Style/ArrayJoin:
  Enabled: true

Style/AsciiComments:
  Enabled: false

Style/AsciiIdentifiers:
  Enabled: true

Style/Attr:
  Enabled: true

Style/BeginBlock:
  Enabled: true

Style/BarePercentLiterals:
  Enabled: true

Style/BlockComments:
  Enabled: true

Style/BlockEndNewline:
  Enabled: true

Style/BlockDelimiters:
  Enabled: false

Style/BracesAroundHashParameters:
  Enabled: true

Style/CaseEquality:
  Enabled: false

Style/CaseIndentation:
  Enabled: true

Style/CharacterLiteral:
  Enabled: true

Style/ClassAndModuleCamelCase:
  Enabled: true

Style/ClassAndModuleChildren:
  Enabled: false

Style/ClassCheck:
  Enabled: true

Style/ClassMethods:
  Enabled: true

Style/ClassVars:
  Enabled: true

Style/ColonMethodCall:
  Enabled: true

Style/CommentAnnotation:
  Enabled: true

Style/CommentIndentation:
  Enabled: true

Style/ConstantName:
  Enabled: true

Style/DefWithParentheses:
  Enabled: true

Style/PreferredHashMethods:
  Enabled: true

Style/Documentation:
  Enabled: false

Style/DotPosition:
  EnforcedStyle: trailing

Style/DoubleNegation:
  Enabled: true

Style/EachWithObject:
  Enabled: true

Style/ElseAlignment:
  Enabled: true

Style/EmptyElse:
  Enabled: true

Style/EmptyLineBetweenDefs:
  Enabled: true

Style/EmptyLines:
  Enabled: true

Style/EmptyLinesAroundAccessModifier:
  Enabled: true

Style/EmptyLinesAroundBlockBody:
  Enabled: true

Style/EmptyLinesAroundClassBody:
  Enabled: true

Style/EmptyLinesAroundModuleBody:
  Enabled: true

Style/EmptyLinesAroundMethodBody:
  Enabled: true

Style/EmptyLiteral:
  Enabled: true

Style/EndBlock:
  Enabled: true

Style/EndOfLine:
  Enabled: true

Style/EvenOdd:
  Enabled: true

Style/FileName:
  Enabled: true

Style/FlipFlop:
  Enabled: true

Style/For:
  Enabled: true

Style/FormatString:
  Enabled: true

Style/GlobalVars:
  Enabled: true

Style/GuardClause:
  Enabled: true

Style/HashSyntax:
  Enabled: true

Style/IfUnlessModifier:
  Enabled: true

Style/IfWithSemicolon:
  Enabled: true

Style/IndentationConsistency:
  Enabled: true

Style/IndentationWidth:
  Enabled: true

Style/IndentArray:
  Enabled: true

Style/IndentHash:
  Enabled: true

Style/InfiniteLoop:
  Enabled: true

Style/Lambda:
  Enabled: true

Style/LambdaCall:
  Enabled: true

Style/LeadingCommentSpace:
  Enabled: true

Style/LineEndConcatenation:
  Enabled: true

Style/MethodCallParentheses:
  Enabled: true

Style/MethodDefParentheses:
  Enabled: true

Style/MethodName:
  Enabled: true
  EnforcedStyle: snake_case

Style/ModuleFunction:
  Enabled: true

Style/MultilineBlockChain:
  Enabled: true

Style/MultilineBlockLayout:
  Enabled: true

Style/MultilineIfThen:
  Enabled: true

Style/MultilineMethodCallIndentation:
  Enabled: true
  EnforcedStyle: indented

Style/MultilineOperationIndentation:
  Enabled: true
  EnforcedStyle: indented

Style/MultilineTernaryOperator:
  Enabled: true

Style/NegatedIf:
  Enabled: true

Style/NegatedWhile:
  Enabled: true

Style/NestedTernaryOperator:
  Enabled: true

Style/Next:
  Enabled: true

Style/NilComparison:
  Enabled: true

Style/NonNilCheck:
  Enabled: true

Style/Not:
  Enabled: true

Style/NumericLiterals:
  Enabled: true

Style/OneLineConditional:
  Enabled: true

Style/OpMethod:
  Enabled: true

Style/ParenthesesAroundCondition:
  Enabled: true

Style/PercentLiteralDelimiters:
  Enabled: true

Style/PercentQLiterals:
  Enabled: true

Style/PerlBackrefs:
  Enabled: true

Style/PredicateName:
  Enabled: true

Style/Proc:
  Enabled: true

Style/RaiseArgs:
  Enabled: true

Style/RedundantBegin:
  Enabled: true

Style/RedundantException:
  Enabled: true

Style/RedundantReturn:
  Enabled: true

Style/RedundantSelf:
  Enabled: false

Style/RegexpLiteral:
  Enabled: true

Style/RescueModifier:
  Enabled: true

Style/SelfAssignment:
  Enabled: true

Style/Semicolon:
  Enabled: true

Style/SignalException:
  Enabled: true

Style/SingleLineBlockParams:
  Enabled: false

Style/SingleLineMethods:
  Enabled: true

Style/SpaceBeforeFirstArg:
  Enabled: true

Style/SpaceAfterColon:
  Enabled: true

Style/SpaceAfterComma:
  Enabled: true

Style/SpaceAroundKeyword:
  Enabled: true

Style/SpaceAfterMethodName:
  Enabled: true

Style/SpaceAfterNot:
  Enabled: true

Style/SpaceAfterSemicolon:
  Enabled: true

Style/SpaceBeforeBlockBraces:
  Enabled: true
  EnforcedStyle: no_space

Style/SpaceBeforeComma:
  Enabled: true

Style/SpaceBeforeComment:
  Enabled: true

Style/SpaceBeforeSemicolon:
  Enabled: true

Style/SpaceInsideBlockBraces:
  Enabled: true
  EnforcedStyle: space
  EnforcedStyleForEmptyBraces: no_space
  SpaceBeforeBlockParameters: true

Style/SpaceAroundEqualsInParameterDefault:
  Enabled: true
  EnforcedStyle: space

Style/SpaceAroundOperators:
  Enabled: true

Style/SpaceInsideBrackets:
  Enabled: true

Style/SpaceInsideHashLiteralBraces:
  Enabled: true
  EnforcedStyle: space
  EnforcedStyleForEmptyBraces : no_space

Style/SpaceInsideParens:
  Enabled: true

Style/SpaceInsideRangeLiteral:
  Enabled: true

Style/SpecialGlobalVars:
  Enabled: true

Style/StringLiterals:
  EnforcedStyle: double_quotes

Style/StringLiteralsInInterpolation:
  Enabled: true

Style/SymbolProc:
  Enabled: true

Style/Tab:
  Enabled: true

Style/TrailingBlankLines:
  Enabled: true

Style/TrailingCommaInArguments:
  EnforcedStyleForMultiline: comma

Style/TrailingCommaInLiteral:
  EnforcedStyleForMultiline: comma

Style/TrailingWhitespace:
  Enabled: true

Style/TrivialAccessors:
  Enabled: true

Style/UnlessElse:
  Enabled: true

Style/UnneededCapitalW:
  Enabled: true

Style/UnneededPercentQ:
  Enabled: true

Style/CommandLiteral:
  Enabled: true

Style/VariableInterpolation:
  Enabled: true

Style/VariableName:
  EnforcedStyle: snake_case

Style/WhenThen:
  Enabled: true

Style/WhileUntilDo:
  Enabled: true

Style/WhileUntilModifier:
  Enabled: true
  MaxLineLength: 128

Style/WordArray:
  Enabled: true

# Metrics

Metrics/AbcSize:
  Enabled: false

Metrics/BlockNesting:
  Enabled: false

Metrics/ClassLength:
  Enabled: false

Metrics/CyclomaticComplexity:
  Enabled: false

Metrics/LineLength:
  Enabled: false

Metrics/MethodLength:
  Enabled: false

Metrics/ParameterLists:
  Enabled: false

Metrics/PerceivedComplexity:
  Enabled: false

Metrics/BlockLength:
  Enabled: false
YAML

run 'rubocop -a'

# git
git :init
git add: '.'
git commit: "-m 'Initial commit'"
