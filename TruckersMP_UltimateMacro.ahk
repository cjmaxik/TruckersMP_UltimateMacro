/*
 *
 * TruckersMP UltimateMacro
 * - by CJMAXiK
 * https://forum.truckersmp.com/index.php?/profile/1223-cjmaxik/
 *
 * Feedback? https://forum.truckersmp.com/index.php?/topic/30058-macros-for-in-game-admins/
 *
*/

/*
 *  ENVIROMENT SETTINGS
*/
#SingleInstance Force ; Only one script instance (Prevents interference)
SetKeyDelay 0
#MaxHotkeysPerInterval 2000
#IfWinActive ahk_class prism3d ; Working only in SCS games, comment out this line for testing

/*
 *  Text for adding. You can use your combination.
 *  Check AHK syntax to do it.
 *  Also contains hotkey for Adding()
*/
Adding(text="") {
    FormatTime, CurrentTime, T8, dd.MM_hh:mm:ss ; change it here
    RetText := text . " " . CurrentTime
    return RetText
}

^+`::
    Send % Adding()
return

/*
 *  Hotkeys for announcment.
 *  It will open chat automatically.
 *  Works only on English locale, change it before sending.
*/

^+1::Send {Y}/sann [EN] Overtaking in Europoort is not allowed{!}{enter}{Y}/sann [RU] Обгон в Европорту запрещен{!}{enter}
^+2::Send {Y}/sann [EN] Parking or stopping in Europoort is not allowed{!}{enter}{Y}/sann [RU] Парковка и стоянка в Европорту запрещены{!}{enter}
^+3::Send {Y}/sann [EN] Please keep your lights on between 19:00 and 7:00. Ghost driving is not allowed{!}{enter}{Y}/sann [RU] Держите фары включенными с 19:00 до 7:00 игрового времени. Движение без света запрещено{!}{enter}
^+4::Send {Y}/sann [EN] Playing music in CB Radio is not allowed{!}{enter}{Y}/sann [RU] Проигрывание музыки в радио запрещено{!}{enter}
^+5::Send {Y}/sann [EN] Using a trailer with your Scout car is against the rules{!}{enter}{Y}/sann [RU] Прицеплять трейлер к легковушке запрещено{!}{enter}
^+6::Send {Y}/sann [EN] Welcome to TruckersMP{!} Happy trucking{!}{enter}{Y}/sann [RU] Приветствуем в TruckersMP{!} Удачной дороги{!}{enter}

/*
 *  HOTSWITCHES in both variants
*/
::next*::
    Send % " (next will be ban)"
return

::horn*::
    Send % Adding("Horn Spamming")
return
::horn/::Horn Spamming (next will be ban)

::admin*::   
    Send % Adding("Impersonating Administration")
return

::rac*::
    Send % Adding("Racing")
return
::rac/::Racing

::ww*::
    Send % Adding("Incorrect Way")
return
::ww/::Incorrect Way

::pro*::
    Send % Adding("Profanity")
return
::pro/::Profanity

::ins*::
    Send % Adding("Insulting")
return
::ins/::Insulting

::chat*::
    Send % Adding("Chat Spamming")
return
::chat/::Chat Spamming

::ram*::
    Send % Adding("Ramming")
return
::ram/::Ramming

::blo*::
    Send % Adding("Blocking")
return
::blo/::Blocking

::speed*::
    Send % Adding("30 d Speedhacking")
return

::lights*::
    Send % Adding("Driving without lights")
return
::lights/::Driving without lights

::map*::
    Send % Adding("Exiting map boundaries")
return
::map/::Exiting map boundaries

::use*::
    Send % Adding("Useless traffic")
return
::use/::Useless traffic

::convoy*::
    Send % Adding("Inappropriate Convoy Management")
return
::convoy/::Inappropriate Convoy Management

::tro*::
    Send % Adding("Trolling")
return
::tro/::Trolling

::cb*::
    Send % Adding("CB Abuse")
return
::cb/::CB Abuse

::car*::
    Send % Adding("3 hrs Car with trailer")
return

::save*::
    Send % Adding("Excessive Save Editing")
return
::save/::Excessive Save Editing (change tuning to stock or you will be banned)

::reck*::
    Send % Adding("Reckless Driving")
return
::reck/::Reckless Driving

::over*::
    Send % Adding("Incorrect Overtaking")
return
::over/::Incorrect Overtaking

::ep*::
    Send % Adding("Overtaking in EP")
return
::ep/::Overtaking in EP

::park*::
    Send % Adding("Inappropriate Parking")
return
::park/::You cannot park here

::nick*::
    Send % Adding("Change your Steam name and make a ban appeal")
return
::nick/::Change your Steam name or you will be banned

::tag*::
    Send % Adding("Change your In-game tag and make a ban appeal")
return
::tag/::Change your In-game tag or you will be banned

/*
 *  Change hotswitch state
*/

global Chat_Var := 0 ; Default state for Hotswitch

~F17::
    ChangeChatState(true)
return

~y::
~LAlt & ~Tab::
~`::
~Esc::
~LWin::
~Shift & ~Tab::
    ChangeChatState(false)
return
    
#if (Chat_Var = "0")
    a::Numpad4        
    w::Numpad8
    s::Numpad5   
    d::Numpad6
    e::Numpad9
    x::Numpad3
    F15::Send {Y}/k{Space}      
    F16::Send {Y}/b{Space}
#if

ChangeChatState(one_direction=false) {
    If Chat_Var = 0 
    {
        Chat_Var := 1
        Chat_Message := "You can type in chat!"
        SoundPlay, %A_WinDir%\Media\Windows Battery Low.wav
    } else if (one_direction=true) {
        Chat_Var := 0
        Chat_Message := "You cannnot type in chat!"
        SoundPlay, %A_WinDir%\Media\Windows Battery Critical.wav
    }
    TrayTip, %state%, %Chat_Message%, 5, 17
    Send {LCtrl Up} ; prevent some stupidity
}