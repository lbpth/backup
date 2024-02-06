;+ = shift		^ = Ctrl		! = Alt		# = Win (Windows logo key)	
;
;green ==================== Quản lý AHK AutoHotKey ==================== BEGIN 2

    #z:: Suspend                    ;Win + Z            = pause và enable autohotkey                                (01)
    #+z:: reload                    ;Win + shift + Z    = reload autohotkey                                         (02)

;black ==================== END ==================== 

;green ==================== Quản lý Capslock và Delete ==================== BEGIN 3
    Capslock:: Delete                   ;Capslock       = Delete                                                    (03)
    #Capslock:: SetCapsLockState, on    ;Win + Capslock = Capslock ON                                               (04)
    #`:: SetCapsLockState, off          ;Win + `        = Capslock OFF                                              (05)

;black ==================== END ==================== 

;green ==================== hotkey cơ bản ==================== BEGIN 
    `:: send, ^w                  	; ` (Ctrl + w) 		= Đóng tab													(06)
    ^`:: send, !{F4}                ;Ctrl + ` (Alt + F4)= Đóng app													(07)
    ^Space:: Send, {Enter}			;Ctrl + Space 		= Enter														(08)
    ^!Space:: Send, {Esc}			;Ctrl + Alt + Space 		= Esc												(09)
    #!9:: Send, {PrintScreen}		;Win + Alt + 9 	= PrintScreen                                                   (10)
    ^!Down::WinMinimize, A  		; Ctrl+Alt+Down 		= Minimize cửa sổ active                                (11)
    ^!LButton::WinMinimize, A       ; Ctrl Alt LeftClick    = Minimize cửa sổ active                                (12)
    #!LButton::WinMinimize, A       ; Win Alt LeftClick     = Minimize cửa sổ active                                (13)

;black ==================== END ====================

;green ==================== Minize All windows except WinActive ====================                                (14)
    ; Win + Ctrl + MouseLeftClick = Win + Home: minimize All exclude WinActive ==================================== 
    ^#LButton:: 
    WinGet, id, list,,, Program Manager
    Loop, %id%
    {
        this_ID := id%A_Index%
        WinGetTitle, active_title, A
        WinGetTitle, title, ahk_id %this_ID%
        If title = %active_title%
        Continue
        WinMinimize, %title%
    }
    return

;black ==================== END ====================

;green ==================== GÕ NHANH ==================== BEGIN

    ^.:: send {…}					; Ctrl + . 			= gõ ... nhanh												(15)

    ^!;:: ;     Ctrl+Alt + ; - Ngày tháng năm hiện tại                                                              (16)
    FormatTime, CurrentDateTime,, yyyyMMdd
    Send, %CurrentDateTime%
    return

    ^!+;:: ; Ctrl+Alt+Shift + ; - thêm Ngày tháng năm giờ phút hiện tại                                             (17)
    FormatTime, CurrentDateTime,, yyyyMMdd HH:mm
    Send, %CurrentDateTime%
    return

;black ==================== END ==================== 

;green ==================== MỞ APP NHANH ==================== BEGIN

    ;+F1:: Run "C:\portapps\Notepad++8.6\notepad++.exe", , max        ;shift F1 = notepad - max = mở full màn		
    +F1:: Run "C:\portapps\Notepad++8.6\notepad++.exe"      ;shift F1 = Notepad++           						(18)
    +F2:: Run "D:\PortApps\Development\Sublime\sublime_text.lnk"      ;shift F2 = Sublime                           (19)
    +!A:: Run "D:\PortableApps\portApps\AnkiPortable\Anki2.1.66\anki.exe"       ;Alt Shift A = Anki                 (23)
    ;+!B:: Run "D:\PortApps\Manager\BitWarden\Bitwarden.lnk"       ;Alt Shift B = BitWarden                          (23)
    +!C:: Run "C:\Program Files\Capacities\Capacities.exe"  ;Alt Shift C = Capacities                               (21)
    +!F:: Run "C:\portapps\FileCentipede-2.82crackPortable\fileu.exe.lnk"  ;Alt Shift F = FileCentipede             (21)
    +!E:: Run, msedge.exe                      				;Alt Shift E = Mở Edge                                  (20)
    +!G:: Run "D:\PortApps\Media\ChatGPT\ChatGPT.lnk"       ;Alt Shift G = ChatGPT Pake                             (23)
    +!I:: Run "C:\Users\Admin\Desktop\Tools\Utility\IDM Internet Download Manager.lnk"       ;Alt Shift I = IDM     (23)
    +!M:: Run "D:\PortableApps\portApps\Browser\MullvadPortable\Mullvad Browser.lnk"        ;Alt Shift M = Mullvad  (24)
    +!N:: Run "C:\Users\Admin\AppData\Local\Programs\Notion\Notion.exe"		;Alt Shift N = Notion				    (22)

    ;Note: Win E = Windows Explorer default
    #+E:: Run "D:\PortApps\Manager\ExplorerPP\Explorer++.lnk"	;Win Shift E =Explorer++		                    (25)
    #+T:: Run "D:\PortApps\Manager\Tablacus\TablacusExplorer64.lnk"	;Win Shift T = Tablacus                         (26)
    #+!1:: Run "C:\portapps\Adobe.Photoshop.CC.18.0.0.53.Portable.x64\PhotoshopCC18.lnk"	;Win Alt Shift 1        (27)
    #+!2:: Run "C:\portapps\PS.2024.v25.2.0.196.Portable\Photoshop2024.exe.lnk"             ;Win Alt Shift 2        (28)
;
;black ==================== END ====================

;green ==================== [Win C] = Search copied với Google ở default browser ====================           (26)
    #c::
    Send ^c
    Sleep 50
    Run "https://www.google.com/search?q=%clipboard%"
    return ; search nội dung vừa copy với Google 

;black ==================== END ====================

;green ==================== [Win B] = Search copied với Bing ở default browser ====================             (27)
    #B::
    Send ^c
    Sleep 50
    Run "https://www.bing.com/search?q=%clipboard%"
    return ; search nội dung vừa copy với Bing

;black ==================== END ====================

;green ==================== Win + G = Mở ChatGPT ở default browser ====================                         (28)
    #G::
    Run "https://chat.openai.com/"
    return ; Mở ChatGPT

;black ==================== END ====================

;green ==================== Save image bằng Shift + Chuột trái ==================== START
    #SingleInstance, Force

    #IfWinActive, ahk_exe firefox.exe ; dành cho Firefox riêng 
    ; # (lưu ý firefox.exe là tên service trong Task Manager) -> đổi tên  floorp.exe về firefox.exe nếu muốn chạy với Floorp
    #+LButton::
        MouseClick, Right
        Send, v
        Sleep, 50
        WinWait, Save Image ahk_class #32770 ahk_exe firefox.exe,, 3
      
        If (ErrorLevel) {
            return
        }
      
        ControlSend, Button1, {Enter}, Save Image ahk_class #32770 ahk_exe firefox.exe
    return
    #IfWinActive

    #IfWinActive, ahk_exe chrome.exe || ahk_exe msedge.exe ;dành cho Chromium riêng
    #+LButton::
        MouseClick, Right
        Send, v
        Sleep, 50
        WinWait, Save Image ahk_class #32770,, 3
      
        If (ErrorLevel) {
            return
        }
      
        ControlSend, Button1, {Enter}, Save Image ahk_class #32770
    return
    #IfWinActive

;black ==================== END ====================

;green ==================== [Alt Shift O] = Mở file dùng Notepad++ ==================== START         (32)

    ; Đặt tổ hợp phím Alt + Shift + O để mở Notepad++ với tệp đã chọn
    !+o::
    ; Lấy đường dẫn của tệp đã chọn từ Clipboard
    Clipboard := ""
    Send, ^c
    ClipWait, 1
    FilePath := Clipboard

    ; Kiểm tra xem đường dẫn có tồn tại không
    if !FileExist(FilePath)
    {
        MsgBox, 48, Error, File not found at %FilePath%`nPlease select a valid file and try again.
        return
    }

    ; Đường dẫn của Notepad++
    NotepadPPPath := "C:\portapps\Notepad++8.6\notepad++.exe"
    ;NotepadPPPath := "C:\Users\Admin\Desktop\Tools\sublime_text.lnk" ;dùng Sublime

    ; Kiểm tra Notepad++ có được cài đặt không
    if !FileExist(NotepadPPPath)
    {
        MsgBox, 48, Error, Notepad++ not found at %NotepadPPPath%`nPlease update the path in the script.
        return
    }

    ; Mở tệp đã chọn bằng Notepad++
    Run, "%NotepadPPPath%" "%FilePath%"
    return

;black ==================== END ====================

;=============================================
;green ==================== [Ctrl Alt Shift Z] = Mở file dùng Bandizip ====================         (25)
    ; Note: Config trong Bandizip khi mở = auto smart extract
    ; Đặt tổ hợp phím Ctrl + Alt + Shift + Z để mở Bandizip với tệp đã chọn
    ^!+Z::
    ; Lấy đường dẫn của tệp đã chọn từ Clipboard
    Clipboard := ""
    Send, ^c
    ClipWait, 1
    FilePath := Clipboard

    ; Kiểm tra xem đường dẫn có tồn tại không
    if !FileExist(FilePath)
    {
        MsgBox, 48, Error, File not found at %FilePath%`nPlease select a valid file and try again.
        return
    }

    ; Đường dẫn của Notepad++
    ZipPath := "C:\Program Files\Bandizip\Bandizip.exe"

    ; Kiểm tra Notepad++ có được cài đặt không
    if !FileExist(ZipPath)
    {
        MsgBox, 48, Error, Bandizip not found at %NotepadPPPath%`nPlease update the path in the script.
        return
    }

    ; Mở tệp đã chọn bằng Bandizip
    Run, "%ZipPath%" "%FilePath%"
    return

;black ==================== END ====================

;green ==================== [Alt Shift P] = search copied text = Google/Bing kèm keyword "PRONUNCIATION" ==================== (27)
    #Persistent
    SetBatchLines, -1

    ; Đặt tổ hợp phím Alt + Shift + P để thêm vào và tìm kiếm dịch tiếng Anh của nội dung đã copy trên Google
    !+p::
        ; Bước 1: Thêm vào " pronunciation" sau nội dung đã copy
        ; Lấy nội dung đã copy từ Clipboard
        Clipboard := ""
        Send, ^c
        ClipWait, 1
        OriginalText := Clipboard

        ; Kiểm tra xem có nội dung để thêm vào không
        if (OriginalText = "")
        {
            MsgBox, 48, Error, No text selected. Please select text and try again.
            return
        }

        ; Thêm vào chuỗi " pronunciation"
        ModifiedText := OriginalText " pronunciation"

        ; Bước 2: Mở Google hoặc Bing search với nội dung ở bước 1
        ;Run, https://www.google.com/search?q=%ModifiedText% ;dùng Google
        Run, https://www.bing.com/search?q=%ModifiedText% ;dùng Bing
        return

;black ==================== END ====================

;green ==================== [Alt Shift B] = search copied text = Bing kèm keyword "in english translation" ==================== (28)
    #Persistent
    SetBatchLines, -1

    ; Đặt tổ hợp phím Alt + Shift + B để thêm vào và tìm kiếm dịch tiếng Anh của nội dung đã copy trên Bing
    !+b::
        ; Bước 1: Thêm vào " in english translation" sau nội dung đã copy
        ; Lấy nội dung đã copy từ Clipboard
        Clipboard := ""
        Send, ^c
        ClipWait, 1
        OriginalText := Clipboard

        ; Kiểm tra xem có nội dung để thêm vào không
        if (OriginalText = "")
        {
            MsgBox, 48, Error, No text selected. Please select text and try again.
            return
        }

        ; Thêm vào chuỗi " in english translation"
        ModifiedText := OriginalText " in english translation"

        ; Bước 2: Mở Bing search với nội dung ở bước 1
        Run, https://www.bing.com/search?q=%ModifiedText%
        return

;black ==================== END ====================

;green MENU tổng
    ^!#m:: ; Ctrl Alt Win M

    ;red Browser Menu ==================== ==================== 
    Menu, BrowserMenu, Add, &1. Floorp, OpenFloorp
    Menu, BrowserMenu, Add, &2. Mullvad, OpenMullvad
    ;red IMG Menu ==================== ==================== 
    Menu, IMGMenu, Add, &1. PTSv18, OpenPTSv18
    Menu, IMGMenu, Add, &2. PTSv24, OpenPTSv24
    Menu, IMGMenu, Add, &3. ShareX, OpenShareX
    Menu, IMGMenu, Add, &4. GreenShot, OpenGreenShot
    Menu, IMGMenu, Add, &5. FlameShot, OpenFlameShot
    Menu, IMGMenu, Add, &6. FScapture, OpenFScapture
    Menu, IMGMenu, Add, &7. LightShot, OpenLightShot
    Menu, IMGMenu, Add, &8. DrawIO, OpenDrawIO
    Menu, IMGMenu, Add, &9. Squoosh convert, OpenSquoosh ; convert ảnh
    ;red Links Menu ==================== ==================== 
    Menu, LinksMenu, Add, &1. VOZ Floorp, OpenVozFloorp
    Menu, LinksMenu, Add, &2. Github LB Floorp, OpenGithubLBFloorp
    ;red Management menu ==================== ==================== 
    Menu, ManagementMenu, Add, &1. Air Explorer 401, OpenAirExplorer
    Menu, ManagementMenu, Add, &2. OneCommander, OpenOneCommander
    Menu, ManagementMenu, Add, &3. Tablacus, OpenTablacus
    Menu, ManagementMenu, Add, &4. Everything, OpenEverything
    Menu, ManagementMenu, Add, &5. TreeSize, OpenTreeSize
    Menu, ManagementMenu, Add, &6. Sandboxie Plus, OpenSandboxiePlus
    Menu, ManagementMenu, Add, &7. Calibre, OpenCalibre
    ;red Office Menu ==================== ==================== 
    Menu, OfficeMenu, Add, &1. Word, OpenWord
    Menu, OfficeMenu, Add, &2. Excel, OpenExcel
    Menu, OfficeMenu, Add, &3. PowerPoint, OpenPPT
    ;red PWA Menu ==================== ==================== 
    Menu, PWAMenu, Add, &1. Discord, OpenDiscord
    Menu, PWAMenu, Add, &2. Capacities HP557, OpenCap557
    Menu, PWAMenu, Add, &3. Notion HP557, OpenNotion557
    Menu, PWAMenu, Add, &4. Zalo 557, OpenZalo557
    Menu, PWAMenu, Add, &5. Telegram 100, OpenTele100
    Menu, PWAMenu, Add, &6. WhatsApp 557, OpenWhatsapp557
    ;red Shortcut Menu ==================== ==================== 
    Menu, ShortcutMenu, Add, &0. MyAHK, OpenMyAHK
    Menu, ShortcutMenu, Add, &1. MyHotkey, OpenMyHotkey
    Menu, ShortcutMenu, Add, &2. EVKey Viết tắt, OpenEVKeyVietTat
    Menu, ShortcutMenu, Add, &3. portapps in C, OpenPortappsC
    Menu, ShortcutMenu, Add, &4. portApps in D, OpenPortAppsD
    Menu, ShortcutMenu, Add, &5. New PortApps in D, OpenNewPortAppsD
    Menu, ShortcutMenu, Add, &6. FF PROFILES, OpenFFProfiles
    ;red Utility Menu ==================== ==================== 
    Menu, UtilityMenu, Add, &1. Anki 23.12, OpenAnki2312
    Menu, UtilityMenu, Add, &2. Anki 2.1.66, OpenAnki2166
    Menu, UtilityMenu, Add, &3. Anki 2.1.61, OpenAnki2161
    Menu, UtilityMenu, Add, &4. Centipede, OpenCentipede
    Menu, UtilityMenu, Add, &5. IDM, OpenIDM
    Menu, UtilityMenu, Add, &i. IDM, OpenIDM
    Menu, UtilityMenu, Add, &6. BitWarden, OpenBitWarden
    Menu, UtilityMenu, Add, &B. BitWarden, OpenBitWarden
    Menu, UtilityMenu, Add, &7. Demergi, OpenDemergi
    Menu, UtilityMenu, Add, &8. Freetube, OpenFreetube
    Menu, UtilityMenu, Add, &9. Hibit Uninstaller, OpenHibitUninstall
    Menu, UtilityMenu, Add, &P. Process Hacker, OpenProcessHacker
    ;red Menu ==================== ==================== ==================== 
    Menu, MyMenu, Add, Browser, :BrowserMenu ;thêm submenu Browser
    Menu, MyMenu, Add, IMG, :IMGMenu ;thêm submenu IMG
    Menu, MyMenu, Add, Links, :LinksMenu ;thêm submenu Links
    Menu, MyMenu, Add, Management, :ManagementMenu ;thêm submenu Management
    Menu, MyMenu, Add, Office, :OfficeMenu ;thêm submenu Office
    Menu, MyMenu, Add, PWA, :PWAMenu ;thêm submenu PWA
    Menu, MyMenu, Add, Shortcut, :ShortcutMenu ;thêm submenu Shortcut
    Menu, MyMenu, Add, Utility, :UtilityMenu ;thêm submenu Utility

    Menu, MyMenu, Show

    return

    ;red IMG menu ========
    OpenPTSv18:
    Run, "C:\portapps\Adobe.Photoshop.CC.18.0.0.53.Portable.x64\Photoshop18\Photoshop CC18 Portable.exe"
    return

    OpenPTSv24:
    Run, "C:\portapps\PS.2024.v25.2.0.196.Portable\Photoshop 2024 Portable.exe"
    return

    OpenShareX:
    Run, "D:\PortableApps\portApps\Utility\ShareX-15.0.0-portable\ShareX.exe"
    return

    OpenGreenShot:
    Run, "D:\PortableApps\portApps\Utility\Greenshot-NO-INSTALLER-1.2.10.6-RELEASE\Greenshot.exe"
    return

    OpenFlameShot:
    Run, "D:\PortApps\Graphic\FlameShot\flameshot.lnk"
    return

    OpenFScapture:
    Run, "C:\portapps\FastStone Capture\FSCapture.exe"
    return

    OpenLightShot:
    Run, "C:\Program Files (x86)\Skillbrains\lightshot\Lightshot.exe"
    return

    OpenDrawIO:
    Run, "D:\Bkup 20231209\portapps\Draw.IO 22.1.2\DrawioPortable\DrawioPortable.exe"
    return

    OpenSquoosh:
    Run, D:\PortableApps\portApps\Browser\Floorp-11.6.1\floorp.exe "-profile" "D:\PortableApps\portApps\Browser\Floorp-11.6.1\PROFILES\Profile01" "-start-ssb" "{6c3488fb-9121-4854-804a-b191fbaf34b3}"
    return



    ;red Office menu =======
    OpenWord:
    Run, winword.exe
    return

    OpenExcel:
    Run, excel.exe
    return

    OpenPPT:
    Run, POWERPNT.exe
    return

    ;red Shortcut menu ======
    OpenMyAHK:
    ;Run, "C:\portapps\Notepad++8.6\notepad++.exe" "C:\portapps\AutoHotKey\MyV1AHK.ahk"
    Run, "D:\PortApps\Development\Sublime\sublime_text.lnk" "C:\portapps\AutoHotKey\MyV1AHK.ahk" ;dùng Sublime
    return

    OpenMyHotkey:
    Run, "D:\PortApps\Development\Sublime\sublime_text.lnk" "D:\PortApps\Log\MyHotkey.csv" ;dùng Sublime
    return

    OpenEVKeyVietTat:
    Run, "D:\PortApps\Development\Sublime\sublime_text.lnk" "C:\portapps\EVKey\evkmacro - Copy.txt" ;dùng Sublime
    return

    OpenPortappsC:
    Run, "C:\portapps"
    return

    OpenPortAppsD:
    Run, "D:\PortableApps\portApps"
    return

    OpenNewPortAppsD:
    Run, "D:\PortApps"
    return

    OpenFFProfiles:
    Run, "D:\PortableApps\portApps\Browser\Floorp-11.6.1\PROFILES"
    return

    ;red PWA =============
    OpenDiscord:
    Run, D:\PortableApps\portApps\Browser\Floorp-11.6.1\floorp.exe "-profile" "D:\PortableApps\portApps\Browser\Floorp-11.6.1\PROFILES\FloorpPWA01" "-start-ssb" "{c42b6add-e250-4679-8010-3f4d534317bb}"
    return

    OpenZalo557:
    Run, D:\PortableApps\portApps\Browser\Floorp-11.6.1\floorp.exe "-profile" "D:\PortableApps\portApps\Browser\Floorp-11.6.1\PROFILES\FloorpPWA01" "-start-ssb" "{dd0f42bc-6feb-4fe2-b125-5f451dacec07}"
    return

    OpenTele100:
    Run, D:\PortableApps\portApps\Browser\Floorp-11.6.1\floorp.exe "-profile" "D:\PortableApps\portApps\Browser\Floorp-11.6.1\PROFILES\FloorpPWA01" "-start-ssb" "{964e4329-783c-4598-95f1-5bfad0d2a32d}"
    return

    OpenCap557:
    Run, D:\PortableApps\portApps\Browser\Floorp-11.6.1\floorp.exe "-profile" "D:\PortableApps\portApps\Browser\Floorp-11.6.1\PROFILES\FloorpPWA01" "-start-ssb" "{0dad6c3d-ac03-4bab-bcd3-89ac46506bbd}" 
    return

    OpenNotion557:
    Run, D:\PortableApps\portApps\Browser\Floorp-11.6.1\floorp.exe "-profile" "D:\PortableApps\portApps\Browser\Floorp-11.6.1\PROFILES\FloorpPWA01" "-start-ssb" "{414cf7c8-d98f-4363-aa79-4cdb6742980f}"
    return

    OpenWhatsapp557:
    Run, D:\PortableApps\portApps\Browser\Floorp-11.6.1\floorp.exe "-profile" "D:\PortableApps\portApps\Browser\Floorp-11.6.1\PROFILES\FloorpPWA01" "-start-ssb" "{367f8fcb-0b8e-4ac1-8816-340c4e53f9ef}"
    return

    ; Utility menu ======
    OpenAnki2166:
    Run, "D:\PortableApps\portApps\AnkiPortable\Anki2.1.66\anki.exe"
    return

    OpenAnki2312:
    Run, "D:\PortableApps\portApps\AnkiPortable\Anki23.12\anki.exe"
    return

    OpenAnki2161:
    Run, "D:\PortableApps\portApps\AnkiPortable\AnkiPortable.exe"
    return

    OpenCentipede:
    Run, "C:\portapps\FileCentipede-2.82crackPortable\fileu.exe"
    return

    OpenIDM:
    Run, "C:\Program Files (x86)\Internet Download Manager\IDMan.exe"
    return

    OpenBitWarden:
    Run, "D:\PortApps\Manager\BitWarden\Bitwarden.lnk"
    return

    OpenDemergi:
    Run, "C:\portapps\demergi-win-x64.exe\demergi-win-x64.exe"
    return

    OpenFreetube:
    Run, "C:\portapps\FreeTube.v0.19.1.Beta\freetube-0.19.1-win-x64-portable.exe"
    return

    OpenHibitUninstall:
    Run, "D:\PortApps\Utility\Tweak-Optimizer\Uninstaller\HiBitUninstaller\HiBitUninstaller.lnk"
    return

    OpenProcessHacker:
    Run, "C:\portapps\processhacker-2.39-bin x64 portable\ProcessHacker.exe"
    return

    ;red BrowserMenus =========
    OpenFloorp:
    Run, "D:\PortableApps\portApps\Browser\Floorp-11.6.1\firefox.exe.lnk"
    return

    OpenMullvad:
    Run, "D:\PortableApps\portApps\Browser\MullvadPortable\Mullvad Browser.lnk"
    return

    ;red Links =========
    OpenVozFloorp:
    Run, "D:\PortableApps\portApps\Browser\Floorp-11.6.1\firefox.exe" -P "Profile01" "htps://voz.vn/t/tong-hop-nhung-addon-chat-cho-firefox-chromium.682181"
    return

    OpenGithubLBFloorp:
    Run, "D:\PortableApps\portApps\Browser\Floorp-11.6.1\floorp.exe" -P "Profile01" "https://github.com/lamborghinipth/lb-userscript/tree/adblock"
    return

    ;red Management =========
    OpenAirExplorer:
    Run, "D:\PortApps\Manager\AirExplorer\AirExplorer401.lnk"
    return

    OpenOneCommander:
    Run, "D:\PortApps\Manager\OneCommander\OneCommander Pro.lnk"
    return

    OpenEverything:
    Run, "D:\PortApps\Manager\Everything\Everything.lnk"
    return

    OpenTablacus:
    Run, "D:\PortApps\Manager\Tablacus\TablacusExplorer64.lnk"
    return

    OpenTreeSize:
    Run, "D:\PortApps\Manager\TreeSize\TreeSizePro.lnk"
    return

    OpenSandboxiePlus:
    Run, "D:\PortApps\Manager\Sandboxie\SandMan.lnk"
    return

    OpenCalibre:
    Run, "D:\PortApps\CalibreEbookManager\Calibre740Portable\calibre-portable.exe"
    return

;black ==================== END ====================

;green ==================== Bọc nhanh đoạn selected text vào ngoặc " " , [ ] , ( ), { }, { } ==================== BEGIN

    ^!+'::		;[Ctrl Alt Shift '] - Bọc " "
        ClipSaved := ClipboardAll ; Lưu trạng thái clipboard hiện tại
        Clipboard := "" ; Xóa nội dung clipboard
        SendInput, ^c ; Sao chép đoạn văn bản được chọn
        ClipWait ; Đợi đến khi dữ liệu được sao chép vào clipboard
        SelectedText := Clipboard ; Lấy đoạn văn bản từ clipboard
        Clipboard := ClipSaved ; Khôi phục trạng thái clipboard
        SendInput, "{Raw}%SelectedText%"
    return

    ^!+[::		;"Ctrl Alt Shift ["- Bọc [ ]
        ClipSaved := ClipboardAll ; Lưu trạng thái clipboard hiện tại
        Clipboard := "" ; Xóa nội dung clipboard
        SendInput, ^c ; Sao chép đoạn văn bản được chọn
        ClipWait ; Đợi đến khi dữ liệu được sao chép vào clipboard
        SelectedText := Clipboard ; Lấy đoạn văn bản từ clipboard
        Clipboard := ClipSaved ; Khôi phục trạng thái clipboard
        SendInput, [{Raw}%SelectedText%]
    return

    ^!+]::		;"Ctrl Alt Shift ]" - Bọc { }
        ClipSaved := ClipboardAll ; Lưu trạng thái clipboard hiện tại
        Clipboard := "" ; Xóa nội dung clipboard
        SendInput, ^c ; Sao chép đoạn văn bản được chọn
        ClipWait ; Đợi đến khi dữ liệu được sao chép vào clipboard
        SelectedText := Clipboard ; Lấy đoạn văn bản từ clipboard
        Clipboard := ClipSaved ; Khôi phục trạng thái clipboard

        ; Loại bỏ dòng trắng giữa các dòng văn bản
        SelectedText := RegExReplace(SelectedText, "(\R\s*){2,}", "{Raw}")
        SendInput, {Raw}{%SelectedText%}
    return

    ^!+0::		;[Ctrl Alt Shift 0] - Bọc ( )
        ClipSaved := ClipboardAll ; Lưu trạng thái clipboard hiện tại
        Clipboard := "" ; Xóa nội dung clipboard
        SendInput, ^c ; Sao chép đoạn văn bản được chọn
        ClipWait ; Đợi đến khi dữ liệu được sao chép vào clipboard
        SelectedText := Clipboard ; Lấy đoạn văn bản từ clipboard
        Clipboard := ClipSaved ; Khôi phục trạng thái clipboard
        SendInput, ({Raw}%SelectedText%)
    return

    ^!+,::      ;[Ctrl Alt Shift ,] - Bọc < >
        ClipSaved := ClipboardAll ; Lưu trạng thái clipboard hiện tại
        Clipboard := "" ; Xóa nội dung clipboard
        SendInput, ^c ; Sao chép đoạn văn bản được chọn
        ClipWait ; Đợi đến khi dữ liệu được sao chép vào clipboard
        SelectedText := Clipboard ; Lấy đoạn văn bản từ clipboard
        Clipboard := ClipSaved ; Khôi phục trạng thái clipboard
        ; Loại bỏ dòng trắng giữa các dòng văn bản
        SelectedText := RegExReplace(SelectedText, "(\R\s*){2,}", "{Raw}")
        SendInput, {Raw}<%SelectedText%>
    return


    ;^!+i::		;[Ctrl Alt Shift i] - Bọc [ICODE] [/ICODE] - Tạm bỏ vì trùng với Ctrl Alt Shift I trong Firefox
    ;    ClipSaved := ClipboardAll ; Lưu trạng thái clipboard hiện tại
    ;    Clipboard := "" ; Xóa nội dung clipboard
    ;    SendInput, ^c ; Sao chép đoạn văn bản được chọn
    ;    ClipWait ; Đợi đến khi dữ liệu được sao chép vào clipboard
    ;    SelectedText := Clipboard ; Lấy đoạn văn bản từ clipboard
    ;    Clipboard := ClipSaved ; Khôi phục trạng thái clipboard
    ;    ; Loại bỏ dòng trắng giữa các dòng văn bản
    ;    SelectedText := RegExReplace(SelectedText, "(\R\s*){2,}", "{Raw}")
    ;    SendInput, {Raw}[ICODE]%SelectedText%[/ICODE]
    ;return

    ^!+c::		;Ctrl Alt Shift C - Bọc Cloze deletion để add vào Anki {{c1:: }}
        ClipSaved := ClipboardAll ; Lưu trạng thái clipboard hiện tại
        Clipboard := "" ; Xóa nội dung clipboard
        SendInput, ^c ; Sao chép đoạn văn bản được chọn
        ClipWait ; Đợi đến khi dữ liệu được sao chép vào clipboard
        SelectedText := Clipboard ; Lấy đoạn văn bản từ clipboard
        Clipboard := ClipSaved ; Khôi phục trạng thái clipboard
        ; Loại bỏ dòng trắng giữa các dòng văn bản
        SelectedText := RegExReplace(SelectedText, "(\R\s*){2,}", "{Raw}")
        SendInput, {Raw}[CODE]%SelectedText%[/CODE]
    return

    ^!+1::      ;[Ctrl Alt Shift 1] - Bọc Cloze deletion để add vào Anki {{c1:: }}
        ClipSaved := ClipboardAll ; Lưu trạng thái clipboard hiện tại
        Clipboard := "" ; Xóa nội dung clipboard
        SendInput, ^c ; Sao chép đoạn văn bản được chọn
        ClipWait ; Đợi đến khi dữ liệu được sao chép vào clipboard
        SelectedText := Clipboard ; Lấy đoạn văn bản từ clipboard
        Clipboard := ClipSaved ; Khôi phục trạng thái clipboard
        ; Loại bỏ dòng trắng giữa các dòng văn bản
        SelectedText := RegExReplace(SelectedText, "(\R\s*){2,}", "{Raw}")
        SendInput, {Raw}{{c1::%SelectedText%}}
    return

    ^!+2::      ;[Ctrl Alt Shift 2] - Bọc Cloze deletion để add vào Anki {{c2:: }}
        ClipSaved := ClipboardAll ; Lưu trạng thái clipboard hiện tại
        Clipboard := "" ; Xóa nội dung clipboard
        SendInput, ^c ; Sao chép đoạn văn bản được chọn
        ClipWait ; Đợi đến khi dữ liệu được sao chép vào clipboard
        SelectedText := Clipboard ; Lấy đoạn văn bản từ clipboard
        Clipboard := ClipSaved ; Khôi phục trạng thái clipboard
        ; Loại bỏ dòng trắng giữa các dòng văn bản
        SelectedText := RegExReplace(SelectedText, "(\R\s*){2,}", "{Raw}")
        SendInput, {Raw}{{c2::%SelectedText%}}
    return

;=============================================
;black ==================== END ====================

;green ==================== Tạo file txt hpa_log_ tại Folder hiện tại (cần copy Folder Zpath) ==================== BEGIN
^!+n:: ;[Ctrl Alt Shift N]
    Clipboard := ""
    Send, ^c
    ClipWait

    If (Clipboard != "" && FileExist(Clipboard) && InStr(Clipboard, "\", false))
    {
        ;"Lấy tên thư mục từ Clipboard
        FileGetAttrib, attr, %Clipboard%
        SplitPath, Clipboard, FolderName

        If (attr ~= "D")
        {
            ; Tạo đường dẫn cho file .txt
            OutputPath := Clipboard . "\hpa_log_" . FolderName . ".txt"

            ; Tạo file .txt và mở để sẵn sàng ghi
            File := FileOpen(OutputPath, "w")
            FileAppend,, %File%
            File.Close()

            ; Mở file .txt bằng notepad
            Run, "D:\PortApps\Development\Sublime\sublime_text.lnk" %OutputPath%
        }
        else
        {
            MsgBox, Clipboard không phải là một đường dẫn thư mục hợp lệ.
        }
    }
    else
    {
        MsgBox, Không có đường dẫn thư mục hợp lệ trong Clipboard.
    }
    return

;black ==================== END ====================

;green ==================== [Win R] - thay chuột phải ==================== BEGIN
    #IfWinActive ; Tất cả các cửa sổ

    ; Bắt đầu định nghĩa tổ hợp phím
    #r:: ; Win + R
        Send, ^c ; Sao chép đường dẫn của file hoặc thư mục đã chọn
        ClipWait ; Chờ đến khi dữ liệu trong clipboard sẵn sàng

        ; Kiểm tra nếu clipboard chứa đường dẫn của file hoặc thư mục
        if (Clipboard) {
            ; Mở context menu bằng phím chuột phải
            Click, right
            Sleep 100 ; Chờ 100ms để đảm bảo menu đã xuất hiện
        }
        return

;black ==================== END ====================

;green ==================== [Win =] - Ghim WinActive on top ==================== BEGIN
    ;lưu ý: hotkey này sẽ tự động dính với tạo hotkey [Ctrl T] bảng trong Excel
    #Persistent
    SetWinDelay, -1

    #=::
        ; Lấy cửa sổ hiện tại
        WinGet, active_id, ID, A
        
        ; Đặt cửa sổ luôn ở trên cùng
        WinSet, AlwaysOnTop, Toggle, ahk_id %active_id%
        
        ; Mở tab mới trong trình duyệt (có thể thay đổi tùy vào ứng dụng bạn đang sử dụng)
        Send, ^t
        
        ; Chờ 0.1 giây để đảm bảo trình duyệt mở tab mới thành công trước khi chuyển focus
        Sleep, 100
        
        ; Chuyển focus về cửa sổ trình duyệt
        WinActivate, ahk_id %active_id%
        
        return
;====================   
;black ==================== END ====================

;green ==================== [Ctrl Alt O] - Tạo file txt hpa_log_ lưu vào Folder đã chỉ định ==================== 
    ^!o:: ;Ctrl + Alt + O
        FormatTime, CurrentDate,, yyyyMMdd
        FormatTime, CurrentDateTime,, yyyyMMdd HH:mm


        ;FileName := "hpa_log_" . CurrentDate . ".txt"
        ;Lưu vào custom path
        CustomPath := "D:\PortApps\Log\" ; Đường dẫn tùy chỉnh của bạn
        FileName := CustomPath . "hpa_log_" . CurrentDate . ".txt"

        ;FileContent := CurrentDateTime "`tThis is the first line.`n"
        ;FileAppend, %FileContent%, %FileName%, UTF-8



        ;"Lấy nội dung từ clipboard
        Clipboard := ""
        Send, ^c
        ClipWait, 1

        ; Nếu có dữ liệu trong clipboard, sử dụng nó và thêm ngày giờ hiện tại
        if Clipboard
        {
            FileContent := CurrentDateTime  "`n" Clipboard "`n"
            FileAppend, %FileContent%, %FileName%, UTF-8
            Run, "D:\PortApps\Development\Sublime\sublime_text.lnk" %fileName%
        }
        else
        {
            MsgBox, No clipboard content found.
        }
        return

        ; Mở file text với Sublime Text
        ;Run, "D:\PortApps\Development\Sublime\sublime_text.lnk" %fileName%
        ;return

