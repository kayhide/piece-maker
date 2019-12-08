module Component.Form where

import Prelude

import Data.Int as Int
import Data.Maybe (maybe)
import Effect (Effect)
import Effect.Console (log)
import Prim.Row as Row
import React.Basic (Component, JSX, createComponent, make, runUpdate)
import React.Basic as React
import React.Basic.DOM as R
import React.Basic.DOM.Events (capture, targetValue)
import Record (merge)

component :: Component Props
component = createComponent "Form"

type PropsRow =
  ( onChange :: State -> Effect Unit
  )

type Props = { | PropsRow }

defaultProps :: Props
defaultProps =
  { onChange: \_ -> pure unit
  }

type State =
  { xCount :: Int
  , yCount :: Int
  , fluctuation :: Number
  , irregularity :: Number
  }

data Action
  = UpdateXCount Int
  | UpdateYCount Int

form
  :: forall attrs
   . Row.Union attrs PropsRow PropsRow
  => { | attrs }
  -> JSX
form props =
  make component { initialState, render }
  $ merge props defaultProps
  where
   initialState =
     { xCount: 10
     , yCount: 18
     , fluctuation: 0.2
     , irregularity: 0.3
     }

   update self = case _ of
     UpdateXCount xCount ->
       React.UpdateAndSideEffects
       (self.state { xCount = xCount })
       \{ state } -> log $ "xCount: " <> show state.xCount

     UpdateYCount yCount ->
       React.UpdateAndSideEffects
       (self.state { yCount = yCount })
       \{ state } -> log $ "yCount: " <> show state.yCount

   send = runUpdate update

   render self =
     React.fragment
        [ R.input
          { onChange:
              capture targetValue
              \v -> v >>= Int.fromString
                    # maybe (pure unit) (send self <<< UpdateXCount)
          , value: show self.state.xCount
          , type: "number"
          }
        , R.input
          { onChange:
            capture targetValue
            \v -> v >>= Int.fromString
                  # maybe (pure unit) (send self <<< UpdateYCount)
          , value: show self.state.yCount
          , type: "number"
          }
        , R.p_ [ R.text ("x : " <> show self.state.xCount) ]
        , R.p_ [ R.text ("y : " <> show self.state.yCount) ]
        ]
