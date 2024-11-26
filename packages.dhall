let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.15-20241124/packages.dhall
        sha256:418bbef5e4ef20c8a82b331919e27b55233f884223100a1b82977ee5736bc730

in  upstream
  with heterogeneous =
    { dependencies =
      [ "arrays"
      , "bifunctors"
      , "console"
      , "effect"
      , "either"
      , "foldable-traversable"
      , "functors"
      , "maybe"
      , "prelude"
      , "record"
      , "tuples"
      , "variant"
      ]
    , repo = "https://github.com/jmatsushita/purescript-heterogeneous"
    , version = "master"
    }

  with variant =
    { dependencies =
      [ "arrays"
      , "assert"
      , "bifunctors"
      , "console"
      , "const"
      , "control"
      , "distributive"
      , "effect"
      , "enums"
      , "either"
      , "foldable-traversable"
      , "foreign-object"
      , "functors"
      , "identity"
      , "lists"
      , "maybe"
      , "newtype"
      , "ordered-collections"
      , "partial"
      , "prelude"
      , "profunctor"
      , "record"
      , "safe-coerce"
      , "transformers"
      , "tuples"
      ]
    , repo = "https://github.com/sigma-andex/purescript-variant"
    , version = "switch-to-visible-type-applications"
    }
