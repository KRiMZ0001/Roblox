#Persistent

; Delay
scrollDelay := 8

loopEnabled := false

; Key
~$*t::
    loopEnabled := !loopEnabled
    If (loopEnabled)
        SetTimer, ScrollLoop, %scrollDelay%
    Else
        SetTimer, ScrollLoop, Off
Return

ScrollLoop:
    ; Check if loop is enabled
    If (loopEnabled) {
        ; Simulate scrolling
        Send, {WheelUp}
        Sleep, %scrollDelay%
        Send, {WheelDown}
        Sleep, %scrollDelay%
    }
Return

; Made By Gian!#0001 | pdfz
