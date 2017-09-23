last_active_window := 0
#WinActivateForce

; Change your hotkey here
F4::

DetectHiddenWindows, on
IfWinExist ssh
{
	IfWinActive ssh
	  {
			WinHide ssh
			WinActivate ahk_id %last_active_window%
		}
	else
	  {
	    WinGet, last_active_window, ID, A
	    WinShow ssh
	    WinActivate ssh
	  }
}
else
{	
	WinGet, last_active_window, ID, A
	Run Console2\Console.exe
}

DetectHiddenWindows, off
return
