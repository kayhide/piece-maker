module Components.App where

import Prelude

import Component.Form (form)
import React.Basic (Component, JSX, createComponent, makeStateless)
import React.Basic.DOM as R

component :: Component Unit
component = createComponent "App"

app :: JSX
app = unit # makeStateless component \_ ->
  R.div_
    [ R.h1_ [ R.text "Piece Maker" ]
    , form
      {}
      -- { onChange:
      --     \_ -> pure unit
      -- }
    ]
