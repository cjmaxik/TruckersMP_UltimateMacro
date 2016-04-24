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
 *  DO NOT TOUCH THIS SECTION!
*/
#SingleInstance Force ; Only one script instance (Prevents interference)
#Hotstring NoMouse ; Mouse can't activate hotstrings
#IfWinActive ahk_class prism3d ; Working only in SCS games

/*
 *  Text for adding. You can use your combination.
 *  Check AHK syntax to do it.
 *  Also contains hotkey for Adding()
*/
Adding() {
    FormatTime, CurrentTime, T8, hh:mm:ss
    return "t" + CurrentTime
}
^+=::
    AddingText := Adding()
    Send %AddingText%
return

/*
 *  Hotkeys for announcment.
 *  Press Y to open chat firstly.
*/
^+1::Send /ann Overtaking in Europoort is not allowed{!}{enter}
^+2::Send /ann Parking in Rotterdam or at Europoort is not allowed{!}{enter}
^+3::Send /ann Please keep your lights on between 19:00 and 7:00. Ghost driving is not allowed{!}{enter}
^+4::Send /ann Playing music in CB Radio is not allowed{!}{enter}

/*
 *  HOTSWITCHES in both variants
*/
::ram*::
    AddingText := Adding()
    Send Ramming %AddingText%
return
::ram/::Ramming 

::blo*::
    AddingText := Adding()
    Send Blocking %AddingText%
return
::blo/::Blocking 

::ww*::
    AddingText := Adding()
    Send Wrong Way %AddingText%
return
::ww/::Wrong Way 

::pro*::
    AddingText := Adding()
    Send Profanity %AddingText%
return
::pro/::Profanity 

::ins*::
    AddingText := Adding()
    Send Insulting %AddingText%
return
::ins/::Insulting 

::gri*::
    AddingText := Adding()
    Send Griefing %AddingText%
return
::gri/::Griefing 

::reck*::
    AddingText := Adding()
    Send Reckless Driving %AddingText%
return
::reck/::Reckless Driving 

::off*::
    AddingText := Adding()
    Send Offensive language %AddingText%
return
::off/::Offensive language 

::nick*::
    AddingText := Adding()
    Send Change your Steam name and make a ban appeal %AddingText%
return
::nick/::Change your Steam name and make a ban appeal 

/*
 *  HOTSWITCHES w/o adding only
*/
::tag/::Change your In-game tag
::lights/::Driving without lights

/*
 *  HOTSWITCHES w/ adding only
*/
::ep*::
    AddingText := Adding()
    Send Overtaking at EP %AddingText%
return