{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "piece-maker"
, dependencies =
    [ "affjax"
    , "console"
    , "effect"
    , "foreign-generic"
    , "psci-support"
    , "random"
    , "react-basic"
    , "web-dom"
    , "web-events"
    , "web-html"
    ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
