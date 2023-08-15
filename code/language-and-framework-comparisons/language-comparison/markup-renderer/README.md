TODO!: move to prog langs notes

conclusion:
bash script > fish script
  - simple scripts, automation
ruby > python
  - scripting (console apps)
crystal == nim == haxe >= OCaml(?) == go
  - compiled / for speed
special cases:
  - crystal/haxe?
    - interop with C
  - haxe/nim/dart
    - transpile to js/wasm or many other langs (don't write js!)
  - elixir (phoenix > sinatra/roda)
    - threading
  - Ocaml
    - parsing/compilers
  - rust >>> C++
    - low-level, memory management
  - C
    - low-low-level

scripting:
**ruby**
**crystal**
  - truly 95% the same as ruby syntax!
  - with ai to generate libs, it should be easy to catch-up
  - with solid C interop, better than go?, makes it the most ideal lang ever (can use for games!! :) )
  - Kemal lib seems a good replacement for Sinatra (for super simple web apps)
  - llvm fast
**elixir**
  - not a big enough program to make use of functional programming
note
  - with threse three, can really have it all(!): scripting, compiled/fast/C-interop, functional
  - a single language syntax to memorize really helps (us humans, at least)
  - also, they all share a great *positive community vibe*

**python** (google)
  - undeniably better readability than ruby
  - has that google feel to it: it works, but that's it

**lua**
  - still sick, maybe just lacking the library that ruby 'n python have, but still can do the basics!

wren
  - the example generated was pretty bad, but gave the reason that it's typically used as an embedded language, without libs for console app stuff

javascript (with node.js)
  - surprisingly might just be the most readable one!

**OCaml**
  - also god-like, 19loc
  - strange 'let' ... 'in' syntax

common lisp
  - 19 loc!
schema (lisp)
  - seems less lispy, more like a general systems lang

perl
  - $a $little $cryptic, but not as bad as i thought!


functional:
erlang
  - python-esque tab-delimited? no keyword or brace to signify end..

haskell
  - i dig the arrows: input -> output, content <- readFile


systems:
**haxe**
  - a clean systems lang
  - macros!
  - **made for games!**
  - although there's a little community around frameworks in it, the dev team is rather closed off

**go** (google)
  - a cleaner C# / systems lang
  - feels very scripty! no static/explicit declarations?

dart
  - feels less scripty, more boring, lots of 'final' keywords (like 'var')

**rust** (mozilla/open-source?)
  - explicit about memory references (&), otherwise the same!
  - terrible class::function syntax
  - llvm

**nim**
  - "C for Python developers"
  - brings the disgusting whitespace-delimited syntax of python to systems langs
  - https://forum.nim-lang.org/t/1880

scala
  - eh, the same as the others..?

C# (microsoft)
  - might actually be the most readable for me
  - has that clunky microsoft boring weighty feel
C++
  - not too bad!
  - llvm fast
C
  - no string class! =O
  - llvm fast

zig
  - explicit about using the allocator to allocate the heap...


other:
julia
  - **maybe the best syntax, combining the best of all**
  - "Fortran for Python developers (more scientific-oriented community and lib, like R)
  - llvm fast

swift (apple crap)
  - uses old Apple Foundation library (NS...)
  - made for Apple devices, but claims to be general

kotlin (java crap)
  - uses old java library
  - ew.

ref:
https://madnight.github.io/githut/#/pull_requests/2023/2
https://github.com/dwyl/learn-elixir/issues/102
