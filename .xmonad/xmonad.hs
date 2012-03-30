import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/vverna/.xmobarrc"

    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
        { ppOutput = hPutStrLn xmproc
            , ppTitle = xmobarColor "green" "" . shorten 50
        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        , terminal = "urxvt"
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        -- XF86AudioMute
        , ((0 , 0x1008ff12), spawn "amixer -q set PCM toggle")
        -- XF86AudioLowerVolume
        , ((0 , 0x1008ff11), spawn "amixer -q set PCM 9- unmute")
        -- XF86AudioRaiseVolume
        , ((0 , 0x1008ff13), spawn "amixer -q set PCM 9+ unmute")
        ]
