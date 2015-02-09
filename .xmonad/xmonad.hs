import System.IO
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Config.Desktop(desktopLayoutModifiers)
import XMonad.Layout.OneBig
import XMonad.Layout.Magnifier
import XMonad.Layout.Spacing

main :: IO()
main = do
  xmproc <- spawnPipe "xmobar ~/.xmonad/xmobarrc"
  xmonad $  defaultConfig
                { borderWidth = 5
                , modMask     = mod4Mask
                , manageHook  = manageDocks <+> manageHook defaultConfig
                --, layoutHook  = avoidStruts $ layoutHook defaultConfig
                , layoutHook  = myLayout
                , logHook     = dynamicLogWithPP $ xmobarPP
                  { ppOutput  = hPutStrLn xmproc
                  , ppTitle   = xmobarColor "green" "" . shorten 50
                  }
                , normalBorderColor  = "#333333"
                , focusedBorderColor = "#cd8b00"
                }
  where
    myLayout = smartSpacing 0 $ desktopLayoutModifiers (magnifiercz' 1.85 $ Mirror one ||| Full)
      where
        one     = OneBig (7/10) (7/10)
        --tiled   = Tall nmaster delta ratio
        --nmaster = 1
        --delta   = 3/100
        --ratio   = 2/3

