module Counter.Server where

import Counter.Core (Msg(..), inc)
import Effect (Effect)
import Erl.Process.Raw (receive, send)
import Prelude


run :: Int -> Effect Unit
run count = pure unit <* (run =<< listen count)

{--
  LambdaCase-style syntax
  instead of the more verbose
  ```
  listen count = do
      a <- receive
      case a of
          ...
--}
listen :: Int -> Effect Int
listen count =
  receive >>= case _ of
    Tick ->
      pure (inc count)

    State pid ->
        send pid count
        *> pure count
