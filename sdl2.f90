! sdl2.f90
!
! SDL2 interface for Fortran 2003/2008/2018.
!
! Author:  Philipp Engel
! GitHub:  https://github.com/interkosmos/f03sdl2/
! Licence: ISC
module sdl2_consts
    use, intrinsic :: iso_c_binding
    implicit none

    integer(kind=c_int), parameter :: SDL_WINDOWPOS_UNDEFINED_MASK = int(z'1FFF0000')
    integer(kind=c_int), parameter :: SDL_WINDOWPOS_UNDEFINED      = ior(sdl_windowpos_undefined_mask, 0)

    integer(kind=c_int), parameter :: SDL_INIT_TIMER          = int(z'00000001')
    integer(kind=c_int), parameter :: SDL_INIT_AUDIO          = int(z'00000010')
    integer(kind=c_int), parameter :: SDL_INIT_VIDEO          = int(z'00000020')
    integer(kind=c_int), parameter :: SDL_INIT_JOYSTICK       = int(z'00000200')
    integer(kind=c_int), parameter :: SDL_INIT_HAPTIC         = int(z'00001000')
    integer(kind=c_int), parameter :: SDL_INIT_GAMECONTROLLER = int(z'00002000')
    integer(kind=c_int), parameter :: SDL_INIT_EVENTS         = int(z'00004000')
    integer(kind=c_int), parameter :: SDL_INIT_NOPARACHUTE    = int(z'00010000')
    integer(kind=c_int), parameter :: SDL_INIT_EVERYTHING     = ior(SDL_INIT_TIMER, &
                                                                    ior(SDL_INIT_VIDEO, &
                                                                    ior(SDL_INIT_VIDEO, &
                                                                    ior(SDL_INIT_JOYSTICK, &
                                                                    ior(SDL_INIT_HAPTIC, &
                                                                    ior(SDL_INIT_GAMECONTROLLER, &
                                                                    ior(SDL_INIT_EVENTS, SDL_INIT_NOPARACHUTE)))))))

    integer(kind=c_int), parameter :: SDL_WINDOW_FULLSCREEN         = int(z'00000001')
    integer(kind=c_int), parameter :: SDL_WINDOW_OPENGL             = int(z'00000002')
    integer(kind=c_int), parameter :: SDL_WINDOW_SHOWN              = int(z'00000004')
    integer(kind=c_int), parameter :: SDL_WINDOW_HIDDEN             = int(z'00000008')
    integer(kind=c_int), parameter :: SDL_WINDOW_BORDERLESS         = int(z'00000010')
    integer(kind=c_int), parameter :: SDL_WINDOW_RESIZABLE          = int(z'00000020')
    integer(kind=c_int), parameter :: SDL_WINDOW_MINIMIZED          = int(z'00000040')
    integer(kind=c_int), parameter :: SDL_WINDOW_MAXIMIZED          = int(z'00000080')
    integer(kind=c_int), parameter :: SDL_WINDOW_INPUT_GRABBED      = int(z'00000100')
    integer(kind=c_int), parameter :: SDL_WINDOW_INPUT_FOCUS        = int(z'00000200')
    integer(kind=c_int), parameter :: SDL_WINDOW_MOUSE_FOCUS        = int(z'00000400')
    integer(kind=c_int), parameter :: SDL_WINDOW_FULLSCREEN_DESKTOP = ior(SDL_WINDOW_FULLSCREEN, int(z'00001000'))
    integer(kind=c_int), parameter :: SDL_WINDOW_FOREIGN            = int(z'00000800')
    integer(kind=c_int), parameter :: SDL_WINDOW_ALLOW_HIGHDPI      = int(z'00002000')
    integer(kind=c_int), parameter :: SDL_WINDOW_MOUSE_CAPTURE      = int(z'00004000')
    integer(kind=c_int), parameter :: SDL_WINDOW_ALWAYS_ON_TOP      = int(z'00008000')
    integer(kind=c_int), parameter :: SDL_WINDOW_SKIP_TASKBAR       = int(z'00010000')
    integer(kind=c_int), parameter :: SDL_WINDOW_UTILITY            = int(z'00020000')
    integer(kind=c_int), parameter :: SDL_WINDOW_TOOLTIP            = int(z'00040000')
    integer(kind=c_int), parameter :: SDL_WINDOW_POPUP_MENU         = int(z'00080000')
    integer(kind=c_int), parameter :: SDL_WINDOW_VULKAN             = int(z'10000000')

    ! SDL_EventType
    integer(kind=c_int), parameter :: SDL_FIRST_EVENT                = 0
    integer(kind=c_int), parameter :: SDL_QUIT_TYPE                  = int(z'100')
    integer(kind=c_int), parameter :: SDL_APP_TERMINATING            = int(z'101')
    integer(kind=c_int), parameter :: SDL_APP_LOW_MEMORY             = int(z'102')
    integer(kind=c_int), parameter :: SDL_APP_WILL_ENTER_BACKGROUND  = int(z'103')
    integer(kind=c_int), parameter :: SDL_APP_DID_ENTER_BACKGROUND   = int(z'104')
    integer(kind=c_int), parameter :: SDL_APP_WILL_ENTER_FOREGROUND  = int(z'105')
    integer(kind=c_int), parameter :: SDL_APP_DID_ENTER_FOREGROUND   = int(z'106')
    integer(kind=c_int), parameter :: SDL_WINDOW                     = int(z'200')
    integer(kind=c_int), parameter :: SDL_SYS_WM                     = int(z'201')
    integer(kind=c_int), parameter :: SDL_KEY_DOWN                   = int(z'300')
    integer(kind=c_int), parameter :: SDL_KEY_UP                     = int(z'301')
    integer(kind=c_int), parameter :: SDL_TEXT_EDITING               = int(z'302')
    integer(kind=c_int), parameter :: SDL_TEXT_INPUT                 = int(z'303')
    integer(kind=c_int), parameter :: SDL_KEY_MAP_CHANGED            = int(z'304')
    integer(kind=c_int), parameter :: SDL_MOUSE_MOTION               = int(z'400')
    integer(kind=c_int), parameter :: SDL_MOUSE_BUTTON_DOWN          = int(z'401')
    integer(kind=c_int), parameter :: SDL_MOUSE_BUTTON_UP            = int(z'402')
    integer(kind=c_int), parameter :: SDL_MOUSE_WHEEL                = int(z'403')
    integer(kind=c_int), parameter :: SDL_JOY_AXIS_MOTION            = int(z'600')
    integer(kind=c_int), parameter :: SDL_JOY_BALL_MOTION            = int(z'601')
    integer(kind=c_int), parameter :: SDL_JOY_HAT_MOTION             = int(z'602')
    integer(kind=c_int), parameter :: SDL_JOY_BUTTON_DOWN            = int(z'603')
    integer(kind=c_int), parameter :: SDL_JOY_BUTTON_UP              = int(z'604')
    integer(kind=c_int), parameter :: SDL_JOY_DEVICE_ADDED           = int(z'605')
    integer(kind=c_int), parameter :: SDL_JOY_DEVICE_REMOVED         = int(z'606')
    integer(kind=c_int), parameter :: SDL_CONTROLLER_AXIS_MOTION     = int(z'650')
    integer(kind=c_int), parameter :: SDL_CONTROLLER_BUTTON_DOWN     = int(z'651')
    integer(kind=c_int), parameter :: SDL_CONTROLLER_BUTTON_UP       = int(z'652')
    integer(kind=c_int), parameter :: SDL_CONTROLLER_DEVICE_ADDED    = int(z'653')
    integer(kind=c_int), parameter :: SDL_CONTROLLER_DEVICE_REMOVED  = int(z'654')
    integer(kind=c_int), parameter :: SDL_CONTROLLER_DEVICE_REMAPPED = int(z'655')
    integer(kind=c_int), parameter :: SDL_FINGER_DOWN                = int(z'700')
    integer(kind=c_int), parameter :: SDL_FINGER_UP                  = int(z'701')
    integer(kind=c_int), parameter :: SDL_FINGER_MOTION              = int(z'702')
    integer(kind=c_int), parameter :: SDL_DOLLAR_GESTURE             = int(z'800')
    integer(kind=c_int), parameter :: SDL_DOLLAR_RECORD              = int(z'801')
    integer(kind=c_int), parameter :: SDL_MULTI_GESTURE              = int(z'802')
    integer(kind=c_int), parameter :: SDL_CLIPBOARD_UPDATE           = int(z'900')
    integer(kind=c_int), parameter :: SDL_DROP_FILE                  = int(z'1000')
    integer(kind=c_int), parameter :: SDL_DROP_TEXT                  = int(z'1001')
    integer(kind=c_int), parameter :: SDL_DROP_BEGIN                 = int(z'1002')
    integer(kind=c_int), parameter :: SDL_DROP_COMPLETE              = int(z'1003')
    integer(kind=c_int), parameter :: SDL_AUDIO_DEVICE_ADDED         = int(z'1100')
    integer(kind=c_int), parameter :: SDL_AUDIO_DEVICE_REMOVED       = int(z'1101')
    integer(kind=c_int), parameter :: SDL_RENDER_TARGETS_RESET       = int(z'2000')
    integer(kind=c_int), parameter :: SDL_RENDER_DEVICE_RESET        = int(z'2001')
    integer(kind=c_int), parameter :: SDL_USER                       = int(z'8000')
    integer(kind=c_int), parameter :: SDL_LAST                       = int(z'FFFF')

    ! SDL_Scancode
    ! (All values are increased by 1, since Fortran array indices begin at 1!)
    integer(kind=c_int), parameter :: SDL_SCANCODE_UNKNOWN            = 1
    integer(kind=c_int), parameter :: SDL_SCANCODE_A                  = 5
    integer(kind=c_int), parameter :: SDL_SCANCODE_B                  = 6
    integer(kind=c_int), parameter :: SDL_SCANCODE_C                  = 7
    integer(kind=c_int), parameter :: SDL_SCANCODE_D                  = 8
    integer(kind=c_int), parameter :: SDL_SCANCODE_E                  = 9
    integer(kind=c_int), parameter :: SDL_SCANCODE_F                  = 10
    integer(kind=c_int), parameter :: SDL_SCANCODE_G                  = 11
    integer(kind=c_int), parameter :: SDL_SCANCODE_H                  = 12
    integer(kind=c_int), parameter :: SDL_SCANCODE_I                  = 13
    integer(kind=c_int), parameter :: SDL_SCANCODE_J                  = 14
    integer(kind=c_int), parameter :: SDL_SCANCODE_K                  = 15
    integer(kind=c_int), parameter :: SDL_SCANCODE_L                  = 16
    integer(kind=c_int), parameter :: SDL_SCANCODE_M                  = 17
    integer(kind=c_int), parameter :: SDL_SCANCODE_N                  = 18
    integer(kind=c_int), parameter :: SDL_SCANCODE_O                  = 19
    integer(kind=c_int), parameter :: SDL_SCANCODE_P                  = 20
    integer(kind=c_int), parameter :: SDL_SCANCODE_Q                  = 21
    integer(kind=c_int), parameter :: SDL_SCANCODE_R                  = 22
    integer(kind=c_int), parameter :: SDL_SCANCODE_S                  = 23
    integer(kind=c_int), parameter :: SDL_SCANCODE_T                  = 24
    integer(kind=c_int), parameter :: SDL_SCANCODE_U                  = 25
    integer(kind=c_int), parameter :: SDL_SCANCODE_V                  = 26
    integer(kind=c_int), parameter :: SDL_SCANCODE_W                  = 27
    integer(kind=c_int), parameter :: SDL_SCANCODE_X                  = 28
    integer(kind=c_int), parameter :: SDL_SCANCODE_Y                  = 29
    integer(kind=c_int), parameter :: SDL_SCANCODE_Z                  = 30
    integer(kind=c_int), parameter :: SDL_SCANCODE_1                  = 31
    integer(kind=c_int), parameter :: SDL_SCANCODE_2                  = 32
    integer(kind=c_int), parameter :: SDL_SCANCODE_3                  = 33
    integer(kind=c_int), parameter :: SDL_SCANCODE_4                  = 34
    integer(kind=c_int), parameter :: SDL_SCANCODE_5                  = 35
    integer(kind=c_int), parameter :: SDL_SCANCODE_6                  = 36
    integer(kind=c_int), parameter :: SDL_SCANCODE_7                  = 37
    integer(kind=c_int), parameter :: SDL_SCANCODE_8                  = 38
    integer(kind=c_int), parameter :: SDL_SCANCODE_9                  = 39
    integer(kind=c_int), parameter :: SDL_SCANCODE_0                  = 40
    integer(kind=c_int), parameter :: SDL_SCANCODE_RETURN             = 41
    integer(kind=c_int), parameter :: SDL_SCANCODE_ESCAPE             = 42
    integer(kind=c_int), parameter :: SDL_SCANCODE_BACKSPACE          = 43
    integer(kind=c_int), parameter :: SDL_SCANCODE_TAB                = 44
    integer(kind=c_int), parameter :: SDL_SCANCODE_SPACE              = 45
    integer(kind=c_int), parameter :: SDL_SCANCODE_MINUS              = 46
    integer(kind=c_int), parameter :: SDL_SCANCODE_EQUALS             = 47
    integer(kind=c_int), parameter :: SDL_SCANCODE_LEFTBRACKET        = 48
    integer(kind=c_int), parameter :: SDL_SCANCODE_RIGHTBRACKET       = 49
    integer(kind=c_int), parameter :: SDL_SCANCODE_BACKSLASH          = 50
    integer(kind=c_int), parameter :: SDL_SCANCODE_NONUSHASH          = 51
    integer(kind=c_int), parameter :: SDL_SCANCODE_SEMICOLON          = 52
    integer(kind=c_int), parameter :: SDL_SCANCODE_APOSTROPHE         = 53
    integer(kind=c_int), parameter :: SDL_SCANCODE_GRAVE              = 54
    integer(kind=c_int), parameter :: SDL_SCANCODE_COMMA              = 55
    integer(kind=c_int), parameter :: SDL_SCANCODE_PERIOD             = 56
    integer(kind=c_int), parameter :: SDL_SCANCODE_SLASH              = 57
    integer(kind=c_int), parameter :: SDL_SCANCODE_CAPSLOCK           = 58
    integer(kind=c_int), parameter :: SDL_SCANCODE_F1                 = 59
    integer(kind=c_int), parameter :: SDL_SCANCODE_F2                 = 60
    integer(kind=c_int), parameter :: SDL_SCANCODE_F3                 = 61
    integer(kind=c_int), parameter :: SDL_SCANCODE_F4                 = 62
    integer(kind=c_int), parameter :: SDL_SCANCODE_F5                 = 63
    integer(kind=c_int), parameter :: SDL_SCANCODE_F6                 = 64
    integer(kind=c_int), parameter :: SDL_SCANCODE_F7                 = 65
    integer(kind=c_int), parameter :: SDL_SCANCODE_F8                 = 66
    integer(kind=c_int), parameter :: SDL_SCANCODE_F9                 = 67
    integer(kind=c_int), parameter :: SDL_SCANCODE_F10                = 68
    integer(kind=c_int), parameter :: SDL_SCANCODE_F11                = 69
    integer(kind=c_int), parameter :: SDL_SCANCODE_F12                = 70
    integer(kind=c_int), parameter :: SDL_SCANCODE_PRINTSCREEN        = 71
    integer(kind=c_int), parameter :: SDL_SCANCODE_SCROLLLOCK         = 72
    integer(kind=c_int), parameter :: SDL_SCANCODE_PAUSE              = 73
    integer(kind=c_int), parameter :: SDL_SCANCODE_INSERT             = 74
    integer(kind=c_int), parameter :: SDL_SCANCODE_HOME               = 75
    integer(kind=c_int), parameter :: SDL_SCANCODE_PAGEUP             = 76
    integer(kind=c_int), parameter :: SDL_SCANCODE_DELETE             = 77
    integer(kind=c_int), parameter :: SDL_SCANCODE_END                = 78
    integer(kind=c_int), parameter :: SDL_SCANCODE_PAGEDOWN           = 79
    integer(kind=c_int), parameter :: SDL_SCANCODE_RIGHT              = 80
    integer(kind=c_int), parameter :: SDL_SCANCODE_LEFT               = 81
    integer(kind=c_int), parameter :: SDL_SCANCODE_DOWN               = 82
    integer(kind=c_int), parameter :: SDL_SCANCODE_UP                 = 83
    integer(kind=c_int), parameter :: SDL_SCANCODE_NUMLOCKCLEAR       = 84
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_DIVIDE          = 85
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_MULTIPLY        = 86
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_MINUS           = 87
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_PLUS            = 88
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_ENTER           = 89
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_1               = 90
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_2               = 91
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_3               = 92
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_4               = 93
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_5               = 94
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_6               = 95
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_7               = 96
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_8               = 97
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_9               = 98
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_0               = 99
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_PERIOD          = 100
    integer(kind=c_int), parameter :: SDL_SCANCODE_NONUSBACKSLASH     = 101
    integer(kind=c_int), parameter :: SDL_SCANCODE_APPLICATION        = 102
    integer(kind=c_int), parameter :: SDL_SCANCODE_POWER              = 103
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_EQUALS          = 104
    integer(kind=c_int), parameter :: SDL_SCANCODE_F13                = 105
    integer(kind=c_int), parameter :: SDL_SCANCODE_F14                = 106
    integer(kind=c_int), parameter :: SDL_SCANCODE_F15                = 107
    integer(kind=c_int), parameter :: SDL_SCANCODE_F16                = 108
    integer(kind=c_int), parameter :: SDL_SCANCODE_F17                = 109
    integer(kind=c_int), parameter :: SDL_SCANCODE_F18                = 110
    integer(kind=c_int), parameter :: SDL_SCANCODE_F19                = 111
    integer(kind=c_int), parameter :: SDL_SCANCODE_F20                = 112
    integer(kind=c_int), parameter :: SDL_SCANCODE_F21                = 113
    integer(kind=c_int), parameter :: SDL_SCANCODE_F22                = 114
    integer(kind=c_int), parameter :: SDL_SCANCODE_F23                = 115
    integer(kind=c_int), parameter :: SDL_SCANCODE_F24                = 116
    integer(kind=c_int), parameter :: SDL_SCANCODE_EXECUTE            = 117
    integer(kind=c_int), parameter :: SDL_SCANCODE_HELP               = 118
    integer(kind=c_int), parameter :: SDL_SCANCODE_MENU               = 119
    integer(kind=c_int), parameter :: SDL_SCANCODE_SELECT             = 120
    integer(kind=c_int), parameter :: SDL_SCANCODE_STOP               = 121
    integer(kind=c_int), parameter :: SDL_SCANCODE_AGAIN              = 122
    integer(kind=c_int), parameter :: SDL_SCANCODE_UNDO               = 123
    integer(kind=c_int), parameter :: SDL_SCANCODE_CUT                = 124
    integer(kind=c_int), parameter :: SDL_SCANCODE_COPY               = 125
    integer(kind=c_int), parameter :: SDL_SCANCODE_PASTE              = 126
    integer(kind=c_int), parameter :: SDL_SCANCODE_FIND               = 127
    integer(kind=c_int), parameter :: SDL_SCANCODE_MUTE               = 128
    integer(kind=c_int), parameter :: SDL_SCANCODE_VOLUMEUP           = 129
    integer(kind=c_int), parameter :: SDL_SCANCODE_VOLUMEDOWN         = 130
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_COMMA           = 134
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_EQUALSAS400     = 135
    integer(kind=c_int), parameter :: SDL_SCANCODE_INTERNATIONAL1     = 136
    integer(kind=c_int), parameter :: SDL_SCANCODE_INTERNATIONAL2     = 137
    integer(kind=c_int), parameter :: SDL_SCANCODE_INTERNATIONAL3     = 138
    integer(kind=c_int), parameter :: SDL_SCANCODE_INTERNATIONAL4     = 139
    integer(kind=c_int), parameter :: SDL_SCANCODE_INTERNATIONAL5     = 140
    integer(kind=c_int), parameter :: SDL_SCANCODE_INTERNATIONAL6     = 141
    integer(kind=c_int), parameter :: SDL_SCANCODE_INTERNATIONAL7     = 142
    integer(kind=c_int), parameter :: SDL_SCANCODE_INTERNATIONAL8     = 143
    integer(kind=c_int), parameter :: SDL_SCANCODE_INTERNATIONAL9     = 144
    integer(kind=c_int), parameter :: SDL_SCANCODE_LANG1              = 145
    integer(kind=c_int), parameter :: SDL_SCANCODE_LANG2              = 146
    integer(kind=c_int), parameter :: SDL_SCANCODE_LANG3              = 147
    integer(kind=c_int), parameter :: SDL_SCANCODE_LANG4              = 148
    integer(kind=c_int), parameter :: SDL_SCANCODE_LANG5              = 149
    integer(kind=c_int), parameter :: SDL_SCANCODE_LANG6              = 150
    integer(kind=c_int), parameter :: SDL_SCANCODE_LANG7              = 151
    integer(kind=c_int), parameter :: SDL_SCANCODE_LANG8              = 152
    integer(kind=c_int), parameter :: SDL_SCANCODE_LANG9              = 153
    integer(kind=c_int), parameter :: SDL_SCANCODE_ALTERASE           = 154
    integer(kind=c_int), parameter :: SDL_SCANCODE_SYSREQ             = 155
    integer(kind=c_int), parameter :: SDL_SCANCODE_CANCEL             = 156
    integer(kind=c_int), parameter :: SDL_SCANCODE_CLEAR              = 157
    integer(kind=c_int), parameter :: SDL_SCANCODE_PRIOR              = 158
    integer(kind=c_int), parameter :: SDL_SCANCODE_RETURN2            = 159
    integer(kind=c_int), parameter :: SDL_SCANCODE_SEPARATOR          = 160
    integer(kind=c_int), parameter :: SDL_SCANCODE_OUT                = 161
    integer(kind=c_int), parameter :: SDL_SCANCODE_OPER               = 162
    integer(kind=c_int), parameter :: SDL_SCANCODE_CLEARAGAIN         = 163
    integer(kind=c_int), parameter :: SDL_SCANCODE_CRSEL              = 164
    integer(kind=c_int), parameter :: SDL_SCANCODE_EXSEL              = 165
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_00              = 177
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_000             = 178
    integer(kind=c_int), parameter :: SDL_SCANCODE_THOUSANDSSEPARATOR = 179
    integer(kind=c_int), parameter :: SDL_SCANCODE_DECIMALSEPARATOR   = 180
    integer(kind=c_int), parameter :: SDL_SCANCODE_CURRENCYUNIT       = 181
    integer(kind=c_int), parameter :: SDL_SCANCODE_CURRENCYSUBUNIT    = 182
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_LEFTPAREN       = 183
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_RIGHTPAREN      = 184
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_LEFTBRACE       = 185
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_RIGHTBRACE      = 186
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_TAB             = 187
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_BACKSPACE       = 188
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_A               = 189
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_B               = 190
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_C               = 191
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_D               = 192
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_E               = 193
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_F               = 194
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_XOR             = 195
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_POWER           = 196
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_PERCENT         = 197
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_LESS            = 198
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_GREATER         = 199
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_AMPERSAND       = 200
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_DBLAMPERSAND    = 201
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_VERTICALBAR     = 202
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_DBLVERTICALBAR  = 203
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_COLON           = 204
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_HASH            = 205
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_SPACE           = 206
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_AT              = 207
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_EXCLAM          = 208
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_MEMSTORE        = 209
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_MEMRECALL       = 210
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_MEMCLEAR        = 211
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_MEMADD          = 212
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_MEMSUBTRACT     = 213
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_MEMMULTIPLY     = 214
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_MEMDIVIDE       = 215
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_PLUSMINUS       = 216
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_CLEAR           = 217
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_CLEARENTRY      = 218
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_BINARY          = 219
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_OCTAL           = 220
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_DECIMAL         = 221
    integer(kind=c_int), parameter :: SDL_SCANCODE_KP_HEXADECIMAL     = 222
    integer(kind=c_int), parameter :: SDL_SCANCODE_LCTRL              = 225
    integer(kind=c_int), parameter :: SDL_SCANCODE_LSHIFT             = 226
    integer(kind=c_int), parameter :: SDL_SCANCODE_LALT               = 227
    integer(kind=c_int), parameter :: SDL_SCANCODE_LGUI               = 228
    integer(kind=c_int), parameter :: SDL_SCANCODE_RCTRL              = 229
    integer(kind=c_int), parameter :: SDL_SCANCODE_RSHIFT             = 230
    integer(kind=c_int), parameter :: SDL_SCANCODE_RALT               = 231
    integer(kind=c_int), parameter :: SDL_SCANCODE_RGUI               = 232
    integer(kind=c_int), parameter :: SDL_SCANCODE_MODE               = 258
    integer(kind=c_int), parameter :: SDL_SCANCODE_AUDIONEXT          = 259
    integer(kind=c_int), parameter :: SDL_SCANCODE_AUDIOPREV          = 260
    integer(kind=c_int), parameter :: SDL_SCANCODE_AUDIOSTOP          = 261
    integer(kind=c_int), parameter :: SDL_SCANCODE_AUDIOPLAY          = 262
    integer(kind=c_int), parameter :: SDL_SCANCODE_AUDIOMUTE          = 263
    integer(kind=c_int), parameter :: SDL_SCANCODE_MEDIASELECT        = 264
    integer(kind=c_int), parameter :: SDL_SCANCODE_WWW                = 265
    integer(kind=c_int), parameter :: SDL_SCANCODE_MAIL               = 266
    integer(kind=c_int), parameter :: SDL_SCANCODE_CALCULATOR         = 267
    integer(kind=c_int), parameter :: SDL_SCANCODE_COMPUTER           = 268
    integer(kind=c_int), parameter :: SDL_SCANCODE_AC_SEARCH          = 269
    integer(kind=c_int), parameter :: SDL_SCANCODE_AC_HOME            = 270
    integer(kind=c_int), parameter :: SDL_SCANCODE_AC_BACK            = 271
    integer(kind=c_int), parameter :: SDL_SCANCODE_AC_FORWARD         = 272
    integer(kind=c_int), parameter :: SDL_SCANCODE_AC_STOP            = 273
    integer(kind=c_int), parameter :: SDL_SCANCODE_AC_REFRESH         = 274
    integer(kind=c_int), parameter :: SDL_SCANCODE_AC_BOOKMARKS       = 275
    integer(kind=c_int), parameter :: SDL_SCANCODE_BRIGHTNESSDOWN     = 276
    integer(kind=c_int), parameter :: SDL_SCANCODE_BRIGHTNESSUP       = 277
    integer(kind=c_int), parameter :: SDL_SCANCODE_DISPLAYSWITCH      = 278
    integer(kind=c_int), parameter :: SDL_SCANCODE_KBDILLUMTOGGLE     = 279
    integer(kind=c_int), parameter :: SDL_SCANCODE_KBDILLUMDOWN       = 280
    integer(kind=c_int), parameter :: SDL_SCANCODE_KBDILLUMUP         = 281
    integer(kind=c_int), parameter :: SDL_SCANCODE_EJECT              = 282
    integer(kind=c_int), parameter :: SDL_SCANCODE_SLEEP              = 283
    integer(kind=c_int), parameter :: SDL_SCANCODE_APP1               = 284
    integer(kind=c_int), parameter :: SDL_SCANCODE_APP2               = 285
    integer(kind=c_int), parameter :: SDL_SCANCODE_AUDIOREWIND        = 286
    integer(kind=c_int), parameter :: SDL_SCANCODE_AUDIOFASTFORWARD   = 287
    integer(kind=c_int), parameter :: SDL_NUM_SCANCODES               = 513

    ! SDL_RendererFlags
    integer(kind=c_int), parameter :: SDL_RENDERER_SOFTWARE      = int(z'00000001')
    integer(kind=c_int), parameter :: SDL_RENDERER_ACCELERATED   = int(z'00000002')
    integer(kind=c_int), parameter :: SDL_RENDERER_PRESENTVSYNC  = int(z'00000004')
    integer(kind=c_int), parameter :: SDL_RENDERER_TARGETTEXTURE = int(z'00000008')

    ! SDL_BlendMode
    integer(kind=c_int), parameter :: SDL_BLENDMODE_NONE    = int(z'00000000')
    integer(kind=c_int), parameter :: SDL_BLENDMODE_BLEND   = int(z'00000001')
    integer(kind=c_int), parameter :: SDL_BLENDMODE_ADD     = int(z'00000002')
    integer(kind=c_int), parameter :: SDL_BLENDMODE_MOD     = int(z'00000004')
    integer(kind=c_int), parameter :: SDL_BLENDMODE_INVALID = int(z'7FFFFFFF')

    integer(kind=c_int16_t), parameter :: SDL_ALPHA_OPAQUE      = 255
    integer(kind=c_int16_t), parameter :: SDL_ALPHA_TRANSPARENT = 0

    ! SDL_Hints
    character(len=*), parameter :: SDL_HINT_FRAMEBUFFER_ACCELERATION                 = 'SDL_FRAMEBUFFER_ACCELERATION'
    character(len=*), parameter :: SDL_HINT_RENDER_DRIVER                            = 'SDL_RENDER_DRIVER'
    character(len=*), parameter :: SDL_HINT_RENDER_OPENGL_SHADERS                    = 'SDL_RENDER_OPENGL_SHADERS'
    character(len=*), parameter :: SDL_HINT_RENDER_DIRECT3D_THREADSAFE               = 'SDL_RENDER_DIRECT3D_THREADSAFE'
    character(len=*), parameter :: SDL_HINT_RENDER_DIRECT3D11_DEBUG                  = 'SDL_RENDER_DIRECT3D11_DEBUG'
    character(len=*), parameter :: SDL_HINT_RENDER_LOGICAL_SIZE_MODE                 = 'SDL_RENDER_LOGICAL_SIZE_MODE'
    character(len=*), parameter :: SDL_HINT_RENDER_SCALE_QUALITY                     = 'SDL_RENDER_SCALE_QUALITY'
    character(len=*), parameter :: SDL_HINT_RENDER_VSYNC                             = 'SDL_RENDER_VSYNC'
    character(len=*), parameter :: SDL_HINT_VIDEO_ALLOW_SCREENSAVER                  = 'SDL_VIDEO_ALLOW_SCREENSAVER'
    character(len=*), parameter :: SDL_HINT_VIDEO_X11_XVIDMODE                       = 'SDL_VIDEO_X11_XVIDMODE'
    character(len=*), parameter :: SDL_HINT_VIDEO_X11_XINERAMA                       = 'SDL_VIDEO_X11_XINERAMA'
    character(len=*), parameter :: SDL_HINT_VIDEO_X11_XRANDR                         = 'SDL_VIDEO_X11_XRANDR'
    character(len=*), parameter :: SDL_HINT_VIDEO_X11_NET_WM_PING                    = 'SDL_VIDEO_X11_NET_WM_PING'
    character(len=*), parameter :: SDL_HINT_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN  = 'SDL_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN'
    character(len=*), parameter :: SDL_HINT_WINDOWS_INTRESOURCE_ICON                 = 'SDL_WINDOWS_INTRESOURCE_ICON'
    character(len=*), parameter :: SDL_HINT_WINDOWS_INTRESOURCE_ICON_SMALL           = 'SDL_WINDOWS_INTRESOURCE_ICON_SMALL'
    character(len=*), parameter :: SDL_HINT_WINDOWS_ENABLE_MESSAGELOOP               = 'SDL_WINDOWS_ENABLE_MESSAGELOOP'
    character(len=*), parameter :: SDL_HINT_GRAB_KEYBOARD                            = 'SDL_GRAB_KEYBOARD'
    character(len=*), parameter :: SDL_HINT_MOUSE_NORMAL_SPEED_SCALE                 = 'SDL_MOUSE_NORMAL_SPEED_SCALE'
    character(len=*), parameter :: SDL_HINT_MOUSE_RELATIVE_SPEED_SCALE               = 'SDL_MOUSE_RELATIVE_SPEED_SCALE'
    character(len=*), parameter :: SDL_HINT_MOUSE_RELATIVE_MODE_WARP                 = 'SDL_MOUSE_RELATIVE_MODE_WARP'
    character(len=*), parameter :: SDL_HINT_MOUSE_FOCUS_CLICKTHROUGH                 = 'SDL_MOUSE_FOCUS_CLICKTHROUGH'
    character(len=*), parameter :: SDL_HINT_TOUCH_MOUSE_EVENTS                       = 'SDL_TOUCH_MOUSE_EVENTS'
    character(len=*), parameter :: SDL_HINT_VIDEO_MINIMIZE_ON_FOCUS_LOSS             = 'SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS'
    character(len=*), parameter :: SDL_HINT_IDLE_TIMER_DISABLED                      = 'SDL_IOS_IDLE_TIMER_DISABLED'
    character(len=*), parameter :: SDL_HINT_ORIENTATIONS                             = 'SDL_IOS_ORIENTATIONS'
    character(len=*), parameter :: SDL_HINT_APPLE_TV_CONTROLLER_UI_EVENTS            = 'SDL_APPLE_TV_CONTROLLER_UI_EVENTS'
    character(len=*), parameter :: SDL_HINT_APPLE_TV_REMOTE_ALLOW_ROTATION           = 'SDL_APPLE_TV_REMOTE_ALLOW_ROTATION'
    character(len=*), parameter :: SDL_HINT_ACCELEROMETER_AS_JOYSTICK                = 'SDL_ACCELEROMETER_AS_JOYSTICK'
    character(len=*), parameter :: SDL_HINT_XINPUT_ENABLED                           = 'SDL_XINPUT_ENABLED'
    character(len=*), parameter :: SDL_HINT_XINPUT_USE_OLD_JOYSTICK_MAPPING          = 'SDL_XINPUT_USE_OLD_JOYSTICK_MAPPING'
    character(len=*), parameter :: SDL_HINT_GAMECONTROLLERCONFIG                     = 'SDL_GAMECONTROLLERCONFIG'
    character(len=*), parameter :: SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES            = 'SDL_GAMECONTROLLER_IGNORE_DEVICES'
    character(len=*), parameter :: SDL_HINT_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT     = 'SDL_GAMECONTROLLER_IGNORE_DEVICES_EXCEPT'
    character(len=*), parameter :: SDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS         = 'SDL_JOYSTICK_ALLOW_BACKGROUND_EVENTS'
    character(len=*), parameter :: SDL_HINT_ALLOW_TOPMOST                            = 'SDL_ALLOW_TOPMOST'
    character(len=*), parameter :: SDL_HINT_TIMER_RESOLUTION                         = 'SDL_TIMER_RESOLUTION'
    character(len=*), parameter :: SDL_HINT_QTWAYLAND_CONTENT_ORIENTATION            = 'SDL_QTWAYLAND_CONTENT_ORIENTATION'
    character(len=*), parameter :: SDL_HINT_QTWAYLAND_WINDOW_FLAGS                   = 'SDL_QTWAYLAND_WINDOW_FLAGS'
    character(len=*), parameter :: SDL_HINT_THREAD_STACK_SIZE                        = 'SDL_THREAD_STACK_SIZE'
    character(len=*), parameter :: SDL_HINT_VIDEO_HIGHDPI_DISABLED                   = 'SDL_VIDEO_HIGHDPI_DISABLED'
    character(len=*), parameter :: SDL_HINT_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK       = 'SDL_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK'
    character(len=*), parameter :: SDL_HINT_VIDEO_WIN_D3DCOMPILER                    = 'SDL_VIDEO_WIN_D3DCOMPILER'
    character(len=*), parameter :: SDL_HINT_VIDEO_WINDOW_SHARE_PIXEL_FORMAT          = 'SDL_VIDEO_WINDOW_SHARE_PIXEL_FORMAT'
    character(len=*), parameter :: SDL_HINT_WINRT_PRIVACY_POLICY_URL                 = 'SDL_WINRT_PRIVACY_POLICY_URL'
    character(len=*), parameter :: SDL_HINT_WINRT_PRIVACY_POLICY_LABEL               = 'SDL_WINRT_PRIVACY_POLICY_LABEL'
    character(len=*), parameter :: SDL_HINT_WINRT_HANDLE_BACK_BUTTON                 = 'SDL_WINRT_HANDLE_BACK_BUTTON'
    character(len=*), parameter :: SDL_HINT_VIDEO_MAC_FULLSCREEN_SPACES              = 'SDL_VIDEO_MAC_FULLSCREEN_SPACES'
    character(len=*), parameter :: SDL_HINT_MAC_BACKGROUND_APP                       = 'SDL_MAC_BACKGROUND_APP'
    character(len=*), parameter :: SDL_HINT_ANDROID_APK_EXPANSION_MAIN_FILE_VERSION  = 'SDL_ANDROID_APK_EXPANSION_MAIN_FILE_VERSION'
    character(len=*), parameter :: SDL_HINT_ANDROID_APK_EXPANSION_PATCH_FILE_VERSION = &
        'SDL_ANDROID_APK_EXPANSION_PATCH_FILE_VERSION'
    character(len=*), parameter :: SDL_HINT_IME_INTERNAL_EDITING                     = 'SDL_IME_INTERNAL_EDITING'
    character(len=*), parameter :: SDL_HINT_ANDROID_SEPARATE_MOUSE_AND_TOUCH         = 'SDL_ANDROID_SEPARATE_MOUSE_AND_TOUCH'
    character(len=*), parameter :: SDL_HINT_EMSCRIPTEN_KEYBOARD_ELEMENT              = 'SDL_EMSCRIPTEN_KEYBOARD_ELEMENT'
    character(len=*), parameter :: SDL_HINT_NO_SIGNAL_HANDLERS                       = 'SDL_NO_SIGNAL_HANDLERS'
    character(len=*), parameter :: SDL_HINT_WINDOWS_NO_CLOSE_ON_ALT_F4               = 'SDL_WINDOWS_NO_CLOSE_ON_ALT_F4'
    character(len=*), parameter :: SDL_HINT_BMP_SAVE_LEGACY_FORMAT                   = 'SDL_BMP_SAVE_LEGACY_FORMAT'
    character(len=*), parameter :: SDL_HINT_WINDOWS_DISABLE_THREAD_NAMING            = 'SDL_WINDOWS_DISABLE_THREAD_NAMING'
    character(len=*), parameter :: SDL_HINT_RPI_VIDEO_LAYER                          = 'SDL_RPI_VIDEO_LAYER'
    character(len=*), parameter :: SDL_HINT_OPENGL_ES_DRIVER                         = 'SDL_OPENGL_ES_DRIVER'
    character(len=*), parameter :: SDL_HINT_AUDIO_RESAMPLING_MODE                    = 'SDL_AUDIO_RESAMPLING_MODE'
    character(len=*), parameter :: SDL_HINT_AUDIO_CATEGORY                           = 'SDL_AUDIO_CATEGORY'

    ! SDL_HintPriority
    enum, bind(c)
        enumerator :: SDL_HINT_DEFAULT
        enumerator :: SDL_HINT_NORMAL
        enumerator :: SDL_HINT_OVERRIDE
    end enum
end module sdl2_consts

module sdl2_types
    use, intrinsic :: iso_c_binding
    implicit none

    ! SDL_Point
    type, bind(c) :: sdl_point
        integer(kind=c_int) :: x
        integer(kind=c_int) :: y
    end type sdl_point

    ! SDL_Rect
    type, bind(c) :: sdl_rect
        integer(kind=c_int) :: x
        integer(kind=c_int) :: y
        integer(kind=c_int) :: w
        integer(kind=c_int) :: h
    end type sdl_rect

    ! SDL_Color
    type, bind(c) :: sdl_color
        integer(kind=c_int16_t) :: r
        integer(kind=c_int16_t) :: g
        integer(kind=c_int16_t) :: b
        integer(kind=c_int16_t) :: a
    end type sdl_color

    ! SDL_Palette
    type, bind(c) :: sdl_palette
        integer(kind=c_int)     :: ncolors
        type(c_ptr)             :: colors
        integer(kind=c_int64_t) :: version
        integer(kind=c_int)     :: refcount
    end type sdl_palette

    ! SDL_PixelFormat
    type, bind(c) :: sdl_pixel_format
        integer(kind=c_int64_t) :: format
        type(c_ptr)             :: palette
        integer(kind=c_int16_t) :: bits_per_pixel
        integer(kind=c_int16_t) :: bytes_per_pixel
        integer(kind=c_int16_t) :: padding(2)
        integer(kind=c_int64_t) :: r_mask
        integer(kind=c_int64_t) :: g_mask
        integer(kind=c_int64_t) :: b_mask
        integer(kind=c_int64_t) :: a_mask
        integer(kind=c_int16_t) :: r_loss
        integer(kind=c_int16_t) :: g_loss
        integer(kind=c_int16_t) :: b_loss
        integer(kind=c_int16_t) :: a_loss
        integer(kind=c_int16_t) :: r_shift
        integer(kind=c_int16_t) :: g_shift
        integer(kind=c_int16_t) :: b_shift
        integer(kind=c_int16_t) :: a_shift
        integer(kind=c_int)     :: ref_count
        type(c_ptr)             :: next
    end type sdl_pixel_format

    ! SDL_Surface
    type, bind(c) :: sdl_surface
        integer(kind=c_int32_t) :: flags
        type(c_ptr)             :: format
        integer(kind=c_int)     :: w
        integer(kind=c_int)     :: h
        integer(kind=c_int)     :: pitch
        type(c_ptr)             :: pixels
        type(c_ptr)             :: userdata
        integer(kind=c_int)     :: locked
        type(c_ptr)             :: lock_data
        type(sdl_rect)          :: clip_rect
        type(c_ptr)             :: map
        integer(kind=c_int)     :: refcount
    end type sdl_surface

    ! SDL_CommonEvent
    type, bind(c) :: sdl_common_event
        integer(kind=c_int64_t) :: type
        integer(kind=c_int64_t) :: timestamp
    end type sdl_common_event

    ! SDL_WindowEvent
    type, bind(c) :: sdl_window_event
        integer(kind=c_int64_t) :: type
        integer(kind=c_int64_t) :: timestamp
        integer(kind=c_int64_t) :: window_id
        integer(kind=c_int16_t) :: event
        integer(kind=c_int16_t) :: padding1
        integer(kind=c_int16_t) :: padding2
        integer(kind=c_int16_t) :: padding3
        integer(kind=c_int64_t) :: data1
        integer(kind=c_int64_t) :: data2
    end type sdl_window_event

    ! SDL_Keysym
    type, bind(c) :: sdl_key_sym
        integer(kind=c_int)     :: scan_code
        integer(kind=c_int32_t) :: sym
        integer(kind=c_int32_t) :: mod
        integer(kind=c_int64_t) :: unused
    end type sdl_key_sym

    ! SDL_KeyboardEvent
    type, bind(c) :: sdl_keyboard_event
        integer(kind=c_int64_t) :: type
        integer(kind=c_int64_t) :: timestamp
        integer(kind=c_int64_t) :: window_id
        integer(kind=c_int16_t) :: state
        integer(kind=c_int16_t) :: repeat
        integer(kind=c_int16_t) :: padding2
        integer(kind=c_int16_t) :: padding3
        type(sdl_key_sym)       :: key_sym
    end type sdl_keyboard_event

    ! SDL_TextEditingEvent
    type, bind(c) :: sdl_text_editing_event
        integer(kind=c_int64_t) :: type
        integer(kind=c_int64_t) :: timestamp
        integer(kind=c_int64_t) :: window_id
        character(kind=c_char)  :: text(32)
        integer(kind=c_int32_t) :: start
        integer(kind=c_int32_t) :: length
    end type sdl_text_editing_event

    ! SDL_TextInputEvent
    type, bind(c) :: sdl_text_input_event
        integer(kind=c_int64_t) :: type
        integer(kind=c_int64_t) :: timestamp
        integer(kind=c_int64_t) :: window_id
        character(kind=c_char)  :: text(32)
    end type sdl_text_input_event

    ! SDL_MouseMotionEvent
    type, bind(c) :: sdl_mouse_motion_event
        integer(kind=c_int64_t) :: type
        integer(kind=c_int64_t) :: timestamp
        integer(kind=c_int64_t) :: window_id
        integer(kind=c_int64_t) :: which
        integer(kind=c_int64_t) :: state
        integer(kind=c_int32_t) :: x
        integer(kind=c_int32_t) :: y
        integer(kind=c_int32_t) :: x_rel
        integer(kind=c_int32_t) :: y_rel
    end type sdl_mouse_motion_event

    ! SDL_MouseButtonEvent
    type, bind(c) :: sdl_mouse_button_event
        integer(kind=c_int64_t) :: type
        integer(kind=c_int64_t) :: timestamp
        integer(kind=c_int64_t) :: window_id
        integer(kind=c_int64_t) :: which
        integer(kind=c_int16_t) :: button
        integer(kind=c_int16_t) :: state
        integer(kind=c_int16_t) :: clicks
        integer(kind=c_int16_t) :: padding1
        integer(kind=c_int32_t) :: x
        integer(kind=c_int32_t) :: y
    end type sdl_mouse_button_event

    ! SDL_MouseWheelEvent
    type, bind(c) :: sdl_mouse_wheel_event
        integer(kind=c_int64_t) :: type
        integer(kind=c_int64_t) :: timestamp
        integer(kind=c_int64_t) :: window_id
        integer(kind=c_int64_t) :: which
        integer(kind=c_int32_t) :: x
        integer(kind=c_int32_t) :: y
        integer(kind=c_int32_t) :: direction
    end type sdl_mouse_wheel_event

    ! SDL_JoyAxisEvent
    type, bind(c) :: sdl_joy_axis_event
        integer(kind=c_int64_t) :: type
        integer(kind=c_int64_t) :: timestamp
        integer(kind=c_int32_t) :: which
        integer(kind=c_int16_t) :: axis
        integer(kind=c_int16_t) :: padding1
        integer(kind=c_int16_t) :: padding2
        integer(kind=c_int16_t) :: padding3
        integer(kind=c_int16_t) :: value
        integer(kind=c_int32_t) :: padding4
    end type sdl_joy_axis_event

    ! SDL_JoyBallEvent
    type, bind(c) :: sdl_joy_ball_event
        integer(kind=c_int64_t) :: type
        integer(kind=c_int64_t) :: timestamp
        integer(kind=c_int32_t) :: which
        integer(kind=c_int16_t) :: ball
        integer(kind=c_int16_t) :: padding1
        integer(kind=c_int16_t) :: padding2
        integer(kind=c_int16_t) :: padding3
        integer(kind=c_int16_t) :: x_rel
        integer(kind=c_int16_t) :: y_rel
    end type sdl_joy_ball_event

    ! SDL_JoyHatEvent
    type, bind(c) :: sdl_joy_hat_event
        integer(kind=c_int64_t) :: type
        integer(kind=c_int64_t) :: timestamp
        integer(kind=c_int32_t) :: which
        integer(kind=c_int16_t) :: hat
        integer(kind=c_int16_t) :: value
        integer(kind=c_int16_t) :: padding1
        integer(kind=c_int16_t) :: padding2
    end type sdl_joy_hat_event

    ! SDL_JoyButtonEvent
    type, bind(c) :: sdl_joy_button_event
        integer(kind=c_int64_t) :: type
        integer(kind=c_int64_t) :: timestamp
        integer(kind=c_int32_t) :: which
        integer(kind=c_int16_t) :: button
        integer(kind=c_int16_t) :: state
        integer(kind=c_int16_t) :: padding1
        integer(kind=c_int16_t) :: padding2
    end type sdl_joy_button_event

    ! SDL_JoyDeviceEvent
    type, bind(c) :: sdl_joy_device_event
        integer(kind=c_int64_t) :: type
        integer(kind=c_int64_t) :: timestamp
        integer(kind=c_int32_t) :: which
    end type sdl_joy_device_event

    ! SDL_ControllerAxisEvent
    type, bind(c) :: sdl_controller_axis_event
        integer(kind=c_int64_t) :: type
        integer(kind=c_int64_t) :: timestamp
        integer(kind=c_int32_t) :: which
        integer(kind=c_int16_t) :: axis
        integer(kind=c_int16_t) :: padding1
        integer(kind=c_int16_t) :: padding2
        integer(kind=c_int16_t) :: padding3
        integer(kind=c_int16_t) :: value
        integer(kind=c_int32_t) :: padding4
    end type sdl_controller_axis_event

    ! SDL_ControllerButtonEvent
    type, bind(c) :: sdl_controller_button_event
        integer(kind=c_int64_t) :: type
        integer(kind=c_int64_t) :: timestamp
        integer(kind=c_int32_t) :: which
        integer(kind=c_int16_t) :: button
        integer(kind=c_int16_t) :: state
        integer(kind=c_int16_t) :: padding1
        integer(kind=c_int16_t) :: padding2
    end type sdl_controller_button_event

    ! SDL_ControllerDeviceEvent
    type, bind(c) :: sdl_controller_device_event
        integer(kind=c_int64_t) :: type
        integer(kind=c_int64_t) :: timestamp
        integer(kind=c_int32_t) :: which
    end type sdl_controller_device_event

    ! SDL_AudioDeviceEvent
    type, bind(c) :: sdl_audio_device_event
        integer(kind=c_int64_t) :: type
        integer(kind=c_int64_t) :: timestamp
        integer(kind=c_int64_t) :: which
        integer(kind=c_int16_t) :: is_capture
        integer(kind=c_int16_t) :: padding1
        integer(kind=c_int16_t) :: padding2
        integer(kind=c_int16_t) :: padding3
    end type sdl_audio_device_event

    ! SDL_TouchFingerEvent
    type, bind(c) :: sdl_touch_finger_event
        integer(kind=c_int64_t) :: type
        integer(kind=c_int64_t) :: timestamp
        integer(kind=c_int64_t) :: touch_id
        integer(kind=c_int64_t) :: finger_id
        real(kind=c_float)      :: x
        real(kind=c_float)      :: y
        real(kind=c_float)      :: dx
        real(kind=c_float)      :: dy
        real(kind=c_float)      :: pressure
    end type sdl_touch_finger_event

    ! SDL_MultiGestureEvent
    type, bind(c) :: sdl_multi_gesture_event
        integer(kind=c_int64_t) :: type
        integer(kind=c_int64_t) :: timestamp
        integer(kind=c_int64_t) :: touch_id
        real(kind=c_float)      :: d_theta
        real(kind=c_float)      :: d_dist
        real(kind=c_float)      :: x
        real(kind=c_float)      :: y
        integer(kind=c_int32_t) :: num_fingers
        integer(kind=c_int32_t) :: padding
    end type sdl_multi_gesture_event

    ! SDL_DollarGestureEvent
    type, bind(c) :: sdl_dollar_gesture_event
        integer(kind=c_int64_t) :: type
        integer(kind=c_int64_t) :: timestamp
        integer(kind=c_int64_t) :: touch_id
        integer(kind=c_int64_t) :: gesture_id
        integer(kind=c_int64_t) :: num_fingers
        real(kind=c_float)      :: error
        real(kind=c_float)      :: x
        real(kind=c_float)      :: y
    end type sdl_dollar_gesture_event

    ! SDL_DropEvent
    type, bind(c) :: sdl_drop_event
        integer(kind=c_int64_t) :: type
        integer(kind=c_int64_t) :: timestamp
        type(c_ptr)             :: file
        integer(kind=c_int64_t) :: window_id
    end type sdl_drop_event

    ! SDL_QuitEvent
    type, bind(c) :: sdl_quit_event
        integer(kind=c_int64_t) :: type
        integer(kind=c_int64_t) :: timestamp
    end type sdl_quit_event

    ! SDL_OSEvent
    type, bind(c) :: sdl_os_event
        integer(kind=c_int64_t) :: type
        integer(kind=c_int64_t) :: timestamp
    end type sdl_os_event

    ! SDL_UserEvent
    type, bind(c) :: sdl_user_event
        integer(kind=c_int64_t) :: type
        integer(kind=c_int64_t) :: timestamp
        integer(kind=c_int64_t) :: window_id
        integer(kind=c_int32_t) :: code
        type(c_ptr)             :: data1
        type(c_ptr)             :: data2
    end type sdl_user_event

    ! SDL_SysWMEvent
    type, bind(c) :: sdl_sys_wm_event
        integer(kind=c_int64_t) :: type
        integer(kind=c_int64_t) :: timestamp
        type(c_ptr)             :: msg
    end type sdl_sys_wm_event

    ! SDL_Event
    type, bind(c) :: sdl_event
        integer(kind=c_int32_t)           :: type
        type(sdl_common_event)            :: common
        type(sdl_window_event)            :: window
        type(sdl_keyboard_event)          :: key
        type(sdl_text_editing_event)      :: edit
        type(sdl_text_input_event)        :: text
        type(sdl_mouse_motion_event)      :: motion
        type(sdl_mouse_button_event)      :: button
        type(sdl_mouse_wheel_event)       :: wheel
        type(sdl_joy_axis_event)          :: j_axis
        type(sdl_joy_ball_event)          :: j_ball
        type(sdl_joy_hat_event)           :: j_hat
        type(sdl_joy_button_event)        :: j_button
        type(sdl_joy_device_event)        :: j_device
        type(sdl_controller_axis_event)   :: c_axis
        type(sdl_controller_button_event) :: c_button
        type(sdl_controller_device_event) :: c_device
        type(sdl_audio_device_event)      :: a_device
        type(sdl_quit_event)              :: quit
        type(sdl_user_event)              :: user
        type(sdl_sys_wm_event)            :: sys_wm
        type(sdl_touch_finger_event)      :: t_finger
        type(sdl_multi_gesture_event)     :: m_gesture
        type(sdl_dollar_gesture_event)    :: d_gesture
        type(sdl_drop_event)              :: drop
        integer(kind=c_int8_t)            :: padding(56)
    end type sdl_event
end module sdl2_types

module sdl2
    implicit none
    private

    public :: sdl_blit_scaled
    public :: sdl_blit_surface
    public :: sdl_convert_surface
    public :: sdl_create_renderer
    public :: sdl_create_texture_from_surface
    public :: sdl_create_window
    public :: sdl_delay
    public :: sdl_destroy_renderer
    public :: sdl_destroy_texture
    public :: sdl_destroy_window
    public :: sdl_fill_rect
    public :: sdl_free_surface
    public :: sdl_get_cpu_count
    public :: sdl_get_error
    public :: sdl_get_hint
    public :: sdl_get_keyboard_state
    public :: sdl_get_pixel_format
    public :: sdl_get_render_target
    public :: sdl_get_system_ram
    public :: sdl_get_ticks
    public :: sdl_get_window_surface
    public :: sdl_has_3dnow
    public :: sdl_has_alti_vec
    public :: sdl_has_avx
    public :: sdl_has_avx2
    public :: sdl_has_mmx
    public :: sdl_has_rdtsc
    public :: sdl_has_sse
    public :: sdl_has_sse2
    public :: sdl_has_sse3
    public :: sdl_has_sse41
    public :: sdl_has_sse42
    public :: sdl_init
    public :: sdl_load_bmp
    public :: sdl_load_bmp_rw
    public :: sdl_map_rgb
    public :: sdl_poll_event
    public :: sdl_pump_events
    public :: sdl_query_texture
    public :: sdl_quit
    public :: sdl_render_clear
    public :: sdl_render_copy
    public :: sdl_render_draw_line
    public :: sdl_render_fill_rect
    public :: sdl_render_present
    public :: sdl_rw_from_file
    public :: sdl_set_clip_rect
    public :: sdl_set_color_key
    public :: sdl_set_hint
    public :: sdl_set_render_draw_blend_mode
    public :: sdl_set_render_draw_color
    public :: sdl_set_render_target
    public :: sdl_set_texture_color_mod
    public :: sdl_update_window_surface
    public :: sdl_upper_blit
    public :: sdl_upper_blit_scaled
    public :: sdl_wait_event

    interface
        ! SDL_Surface *SDL_ConvertSurface(SDL_Surface *src, const SDL_PixelFormat *fmt, Uint32 flags)
        function sdl_convert_surface_(src, fmt, flags) bind(c, name='SDL_ConvertSurface')
            use, intrinsic :: iso_c_binding
            use :: sdl2_types
            implicit none
            type(sdl_surface),       intent(in)        :: src
            type(sdl_pixel_format),  intent(in)        :: fmt
            integer(kind=c_int32_t), intent(in), value :: flags
            type(c_ptr)                                :: sdl_convert_surface_
        end function sdl_convert_surface_

        ! SDL_Renderer *SDL_CreateRenderer(SDL_Window *window, int index, Uint32 flags)
        function sdl_create_renderer(window, index, flags) bind(c, name='SDL_CreateRenderer')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr),             intent(in), value :: window
            integer(kind=c_int),     intent(in), value :: index
            integer(kind=c_int32_t), intent(in), value :: flags
            type(c_ptr)                                :: sdl_create_renderer
        end function sdl_create_renderer

        ! SDL_Texture *SDL_CreateTextureFromSurface(SDL_Renderer *renderer, SDL_Surface *surface)
        function sdl_create_texture_from_surface(renderer, surface) bind(c, name='SDL_CreateTextureFromSurface')
            use, intrinsic :: iso_c_binding
            use :: sdl2_types
            implicit none
            type(c_ptr),       intent(in), value :: renderer
            type(sdl_surface), intent(in)        :: surface
            type(c_ptr)                          :: sdl_create_texture_from_surface
        end function sdl_create_texture_from_surface

        ! SDL_Window *SDL_CreateWindow(const char *title, int x, int y, int w, int h, Uint32 flags)
        function sdl_create_window(title, x, y, w, h, flags) bind(c, name='SDL_CreateWindow')
            use, intrinsic :: iso_c_binding
            implicit none
            character(kind=c_char),  intent(in)        :: title
            integer(kind=c_int),     intent(in), value :: x
            integer(kind=c_int),     intent(in), value :: y
            integer(kind=c_int),     intent(in), value :: w
            integer(kind=c_int),     intent(in), value :: h
            integer(kind=c_int32_t), intent(in), value :: flags
            type(c_ptr)                                :: sdl_create_window
        end function sdl_create_window

        ! int SDL_FillRect(SDL_Surface *dst, const SDL_Rect *rect, Uint32 color)
        function sdl_fill_rect(dst, rect, color) bind(c, name='SDL_FillRect')
            use, intrinsic :: iso_c_binding
            use :: sdl2_types
            implicit none
            type(sdl_surface),       intent(in)        :: dst
            type(sdl_rect),          intent(in)        :: rect
            integer(kind=c_int32_t), intent(in), value :: color
            integer(kind=c_int)                        :: sdl_fill_rect
        end function sdl_fill_rect

        ! int SDL_GetCPUCount(void)
        function sdl_get_cpu_count() bind(c, name='SDL_GetCPUCount')
            use, intrinsic :: iso_c_binding
            implicit none
            integer(kind=c_int) :: sdl_get_cpu_count
        end function sdl_get_cpu_count

        ! const char *SDL_GetError(void)
        function sdl_get_error_() bind(c, name='SDL_GetError')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr) :: sdl_get_error_
        end function sdl_get_error_

        ! const Uint8 *SDL_GetKeyboardState(int *numkeys)
        function sdl_get_keyboard_state_(numkeys) bind(c, name='SDL_GetKeyboardState')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: numkeys
            type(c_ptr)                    :: sdl_get_keyboard_state_
        end function sdl_get_keyboard_state_

        ! const char *SDL_GetHint(const char *name)
        function sdl_get_hint_(name) bind(c, name='SDL_GetHint')
            use, intrinsic :: iso_c_binding
            implicit none
            character(kind=c_char), intent(in) :: name
            type(c_ptr)                        :: sdl_get_hint_
        end function sdl_get_hint_

        ! int SDL_GetSystemRAM(void)
        function sdl_get_system_ram() bind(c, name='SDL_GetSystemRAM')
            use, intrinsic :: iso_c_binding
            implicit none
            integer(kind=c_int) :: sdl_get_system_ram
        end function sdl_get_system_ram

        ! Uint32 SDL_GetTicks(void)
        function sdl_get_ticks() bind(c, name='SDL_GetTicks')
            use, intrinsic :: iso_c_binding
            implicit none
            integer(kind=c_int64_t) :: sdl_get_ticks
        end function sdl_get_ticks

        ! SDL_Surface *SDL_GetWindowSurface(SDL_Window *window)
        function sdl_get_window_surface_(window) bind(c, name='SDL_GetWindowSurface')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: window
            type(c_ptr)                    :: sdl_get_window_surface_
        end function sdl_get_window_surface_

        ! SDL_bool SDL_Has3DNow(void)
        function sdl_has_3dnow() bind(c, name='SDL_Has3DNow')
            use, intrinsic :: iso_c_binding
            implicit none
            integer(kind=c_int) :: sdl_has_3dnow
        end function sdl_has_3dnow

        ! SDL_bool SDL_HasAltiVec(void)
        function sdl_has_alti_vec() bind(c, name='SDL_HasAltiVec')
            use, intrinsic :: iso_c_binding
            implicit none
            integer(kind=c_int) :: sdl_has_alti_vec
        end function sdl_has_alti_vec

        ! SDL_bool SDL_HasAVX(void)
        function sdl_has_avx() bind(c, name='SDL_HasAVX')
            use, intrinsic :: iso_c_binding
            implicit none
            integer(kind=c_int) :: sdl_has_avx
        end function sdl_has_avx

        ! SDL_bool SDL_HasAVX2(void)
        function sdl_has_avx2() bind(c, name='SDL_HasAVX2')
            use, intrinsic :: iso_c_binding
            implicit none
            integer(kind=c_int) :: sdl_has_avx2
        end function sdl_has_avx2

        ! SDL_bool SDL_HasMMX(void)
        function sdl_has_mmx() bind(c, name='SDL_HasMMX')
            use, intrinsic :: iso_c_binding
            implicit none
            integer(kind=c_int) :: sdl_has_mmx
        end function sdl_has_mmx

        ! SDL_bool SDL_HasRDTSC(void)
        function sdl_has_rdtsc() bind(c, name='SDL_HasRDTSC')
            use, intrinsic :: iso_c_binding
            implicit none
            integer(kind=c_int) :: sdl_has_rdtsc
        end function sdl_has_rdtsc

        ! SDL_bool SDL_HasSSE(void)
        function sdl_has_sse() bind(c, name='SDL_HasSSE')
            use, intrinsic :: iso_c_binding
            implicit none
            integer(kind=c_int) :: sdl_has_sse
        end function sdl_has_sse

        ! SDL_bool SDL_HasSSE2(void)
        function sdl_has_sse2() bind(c, name='SDL_HasSSE2')
            use, intrinsic :: iso_c_binding
            implicit none
            integer(kind=c_int) :: sdl_has_sse2
        end function sdl_has_sse2

        ! SDL_bool SDL_HasSSE3(void)
        function sdl_has_sse3() bind(c, name='SDL_HasSSE3')
            use, intrinsic :: iso_c_binding
            implicit none
            integer(kind=c_int) :: sdl_has_sse3
        end function sdl_has_sse3

        ! SDL_bool SDL_HasSSE41(void)
        function sdl_has_sse41() bind(c, name='SDL_HasSSE41')
            use, intrinsic :: iso_c_binding
            implicit none
            integer(kind=c_int) :: sdl_has_sse41
        end function sdl_has_sse41

        ! SDL_bool SDL_HasSSE42(void)
        function sdl_has_sse42() bind(c, name='SDL_HasSSE42')
            use, intrinsic :: iso_c_binding
            implicit none
            integer(kind=c_int) :: sdl_has_sse42
        end function sdl_has_sse42

        ! int SDL_Init(Uint32 flags)
        function sdl_init(flags) bind(c, name='SDL_Init')
            use, intrinsic :: iso_c_binding
            implicit none
            integer(kind=c_int32_t), intent(in), value :: flags
            integer(kind=c_int)                        :: sdl_init
        end function sdl_init

        ! SDL_Surface *SDL_LoadBMP_RW(SDL_RWops *src, int freesrc)
        function sdl_load_bmp_rw(src, free_src) bind(c, name='SDL_LoadBMP_RW')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr),         intent(in), value :: src
            integer(kind=c_int), intent(in), value :: free_src
            type(c_ptr)                            :: sdl_load_bmp_rw
        end function sdl_load_bmp_rw

        ! Uint32 SDL_MapRGB(const SDL_PixelFormat *format, Uint8 r, Uint8 g, Uint8 b)
        function sdl_map_rgb(format, r, g, b) bind(c, name='SDL_MapRGB')
            use, intrinsic :: iso_c_binding
            use :: sdl2_types
            implicit none
            type(sdl_pixel_format),  intent(in)        :: format
            integer(kind=c_int16_t), intent(in), value :: r
            integer(kind=c_int16_t), intent(in), value :: g
            integer(kind=c_int16_t), intent(in), value :: b
            integer(kind=c_int64_t)                    :: sdl_map_rgb
        end function sdl_map_rgb

        ! int SDL_PollEvent(SDL_Event *event)
        function sdl_poll_event_(event) bind(c, name='SDL_PollEvent')
            use, intrinsic :: iso_c_binding
            use :: sdl2_types
            implicit none
            type(sdl_event), intent(in out) :: event
            integer(kind=c_int)             :: sdl_poll_event_
        end function sdl_poll_event_

        ! int SDL_QueryTexture(SDL_Texture *texture, Uint32 *format, int *access, int *w, int *h)
        function sdl_query_texture(texture, format, access, w, h) bind(c, name='SDL_QueryTexture')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr),             intent(in), value :: texture
            integer(kind=c_int32_t), intent(in out)    :: format
            integer(kind=c_int),     intent(in out)    :: access
            integer(kind=c_int),     intent(in out)    :: w
            integer(kind=c_int),     intent(in out)    :: h
            integer(kind=c_int)                        :: sdl_query_texture
        end function sdl_query_texture

        ! SDL_RWops *SDL_RWFromFile(const char *file, const char *mode)
        function sdl_rw_from_file(file, mode) bind(c, name='SDL_RWFromFile')
            use, intrinsic :: iso_c_binding
            implicit none
            character(kind=c_char), intent(in) :: file
            character(kind=c_char), intent(in) :: mode
            type(c_ptr)                        :: sdl_rw_from_file
        end function sdl_rw_from_file

        ! int SDL_RenderClear(SDL_Renderer *renderer)
        function sdl_render_clear(renderer) bind(c, name='SDL_RenderClear')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: renderer
            integer(kind=c_int)            :: sdl_render_clear
        end function sdl_render_clear

        ! int SDL_RenderCopy(SDL_Renderer *renderer, SDL_Texture *texture, const SDL_Rect *srcrect, const SDL_Rect *dstrect)
        function sdl_render_copy(renderer, texture, src_rect, dst_rect) bind(c, name='SDL_RenderCopy')
            use, intrinsic :: iso_c_binding
            use :: sdl2_types
            implicit none
            type(c_ptr),    intent(in), value :: renderer
            type(c_ptr),    intent(in), value :: texture
            type(sdl_rect), intent(in)        :: src_rect
            type(sdl_rect), intent(in)        :: dst_rect
            integer(kind=c_int)               :: sdl_render_copy
        end function sdl_render_copy

        ! int SDL_RenderDrawLine(SDL_Renderer *renderer, int x1, int y1, int x2, int y2)
        function sdl_render_draw_line(renderer, x1, y1, x2, y2) bind(c, name='SDL_RenderDrawLine')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr),         intent(in), value :: renderer
            integer(kind=c_int), intent(in), value :: x1
            integer(kind=c_int), intent(in), value :: y1
            integer(kind=c_int), intent(in), value :: x2
            integer(kind=c_int), intent(in), value :: y2
            integer(kind=c_int)                    :: sdl_render_draw_line
        end function sdl_render_draw_line

        ! int SDL_RenderFillRect(SDL_Renderer *renderer, const SDL_Rect *rect)
        function sdl_render_fill_rect(renderer, rect) bind(c, name='SDL_RenderFillRect')
            use, intrinsic :: iso_c_binding
            use :: sdl2_types
            implicit none
            type(c_ptr),    intent(in), value :: renderer
            type(sdl_rect), intent(in)        :: rect
            integer(kind=c_int)               :: sdl_render_fill_rect
        end function sdl_render_fill_rect

        ! SDL_bool SDL_SetClipRect(SDL_Surface *surface, const SDL_Rect *rect)
        function sdl_set_clip_rect(surface, rect) bind(c, name='SDL_SetClipRect')
            use, intrinsic :: iso_c_binding
            use :: sdl2_types
            implicit none
            type(sdl_surface), intent(in) :: surface
            type(sdl_rect),    intent(in) :: rect
            integer(kind=c_int)           :: sdl_set_clip_rect
        end function sdl_set_clip_rect

        ! int SDL_SetColorKey(SDL_Surface *surface, int flag, Uint32 key)
        function sdl_set_color_key(surface, flag, key) bind(c, name='SDL_SetColorKey')
            use, intrinsic :: iso_c_binding
            use :: sdl2_types
            implicit none
            type(sdl_surface),       intent(in)        :: surface
            integer(kind=c_int),     intent(in), value :: flag
            integer(kind=c_int32_t), intent(in), value :: key
            integer(kind=c_int)                        :: sdl_set_color_key
        end function sdl_set_color_key

        ! SDL_bool SDL_SetHint(const char *name, const char *value)
        function sdl_set_hint_(name, value) bind(c, name='SDL_SetHint')
            use, intrinsic :: iso_c_binding
            implicit none
            character(kind=c_char), intent(in) :: name
            character(kind=c_char), intent(in) :: value
            integer(kind=c_int)                :: sdl_set_hint_
        end function sdl_set_hint_

        ! int SDL_SetRenderDrawBlendMode(SDL_Renderer *renderer, SDL_BlendMode blendMode)
        function sdl_set_render_draw_blend_mode(renderer, blend_mode) bind(c, name='SDL_SetRenderDrawBlendMode')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr),         intent(in), value :: renderer
            integer(kind=c_int), intent(in), value :: blend_mode
            integer(kind=c_int)                    :: sdl_set_render_draw_blend_mode
        end function sdl_set_render_draw_blend_mode

        ! int SDL_SetRenderDrawColor(SDL_Renderer *renderer, Uint8 r, Uint8 g, Uint8 b, Uint8 a)
        function sdl_set_render_draw_color(renderer, r, g, b, a) bind(c, name='SDL_SetRenderDrawColor')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr),             intent(in), value :: renderer
            integer(kind=c_int16_t), intent(in), value :: r
            integer(kind=c_int16_t), intent(in), value :: g
            integer(kind=c_int16_t), intent(in), value :: b
            integer(kind=c_int16_t), intent(in), value :: a
            integer(kind=c_int)                        :: sdl_set_render_draw_color
        end function sdl_set_render_draw_color

        ! int SDL_SetRenderTarget(SDL_Renderer *renderer, SDL_Texture *texture)
        function sdl_set_render_target(renderer, texture) bind(c, name='SDL_SetRenderTarget')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr),             intent(in), value :: renderer
            type(c_ptr),             intent(in), value :: texture
            integer(kind=c_int)                        :: sdl_set_render_target
        end function sdl_set_render_target

        ! int SDL_SetTextureColorMod(SDL_Texture *texture, Uint8 r, Uint8 g, Uint8 b)
        function sdl_set_texture_color_mod(texture, r, g, b) bind(c, name='SDL_SetTextureColorMod')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr),             intent(in), value :: texture
            integer(kind=c_int16_t), intent(in), value :: r
            integer(kind=c_int16_t), intent(in), value :: g
            integer(kind=c_int16_t), intent(in), value :: b
            integer(kind=c_int)                        :: sdl_set_texture_color_mod
        end function sdl_set_texture_color_mod

        ! int SDL_UpdateWindowSurface(SDL_Window *window)
        function sdl_update_window_surface(window) bind(c, name='SDL_UpdateWindowSurface')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: window
            integer(kind=c_int)            :: sdl_update_window_surface
        end function sdl_update_window_surface

        ! int SDL_UpperBlit(SDL_Surface *src, const SDL_Rect *srcrect, SDL_Surface *dst, SDL_Rect *dstrect)
        function sdl_upper_blit(src, src_rect, dst, dst_rect) bind(c, name='SDL_UpperBlit')
            use, intrinsic :: iso_c_binding
            use :: sdl2_types
            implicit none
            type(sdl_surface), intent(in) :: src
            type(sdl_rect),    intent(in) :: src_rect
            type(sdl_surface), intent(in) :: dst
            type(sdl_rect),    intent(in) :: dst_rect
            integer(kind=c_int)           :: sdl_upper_blit
        end function sdl_upper_blit

        ! int SDL_UpperBlitScaled(SDL_Surface *src, const SDL_Rect *srcrect, SDL_Surface *dst, SDL_Rect *dstrect)
        function sdl_upper_blit_scaled(src, src_rect, dst, dst_rect) bind(c, name='SDL_UpperBlitScaled')
            use, intrinsic :: iso_c_binding
            use :: sdl2_types
            implicit none
            type(sdl_surface), intent(in) :: src
            type(sdl_rect),    intent(in) :: src_rect
            type(sdl_surface), intent(in) :: dst
            type(sdl_rect),    intent(in) :: dst_rect
            integer(kind=c_int)           :: sdl_upper_blit_scaled
        end function sdl_upper_blit_scaled

        ! int SDL_WaitEvent(SDL_Event *event)
        function sdl_wait_event_(event) bind(c, name='SDL_WaitEvent')
            use, intrinsic :: iso_c_binding
            use :: sdl2_types
            implicit none
            type(sdl_event), intent(in out) :: event
            integer(kind=c_int)             :: sdl_wait_event_
        end function sdl_wait_event_

        ! void SDL_Delay(Uint32 ms)
        subroutine sdl_delay(ms) bind(c, name='SDL_Delay')
            use, intrinsic :: iso_c_binding
            implicit none
            integer(kind=c_int32_t), intent(in), value :: ms
        end subroutine sdl_delay

        ! void SDL_DestroyRenderer(SDL_Renderer *renderer)
        subroutine sdl_destroy_renderer(renderer) bind(c, name='SDL_DestroyRenderer')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: renderer
        end subroutine sdl_destroy_renderer

        ! void SDL_DestroyTexture(SDL_Texture *texture)
        subroutine sdl_destroy_texture(texture) bind(c, name='SDL_DestroyTexture')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: texture
        end subroutine sdl_destroy_texture

        ! void SDL_DestroyWindow(SDL_Window *window)
        subroutine sdl_destroy_window(window) bind(c, name='SDL_DestroyWindow')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: window
        end subroutine sdl_destroy_window

        ! void SDL_FreeSurface(SDL_Surface *surface)
        subroutine sdl_free_surface(surface) bind(c, name='SDL_FreeSurface')
            use, intrinsic :: iso_c_binding
            use :: sdl2_types
            implicit none
            type(sdl_surface), intent(in) :: surface
        end subroutine sdl_free_surface

        ! void SDL_PumpEvents(void)
        subroutine sdl_pump_events() bind(c, name='SDL_PumpEvents')
        end subroutine sdl_pump_events

        ! void SDL_RenderPresent(SDL_Renderer *renderer)
        subroutine sdl_render_present(renderer) bind(c, name='SDL_RenderPresent')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: renderer
        end subroutine sdl_render_present

        ! void SDL_Quit(void)
        subroutine sdl_quit() bind(c, name='SDL_Quit')
        end subroutine sdl_quit
    end interface

    contains
        ! int SDL_BlitScaled(SDL_Surface *src, const SDL_Rect *srcrect, SDL_Surface *dst, SDL_Rect *dstrect)
        function sdl_blit_scaled(src, src_rect, dst, dst_rect)
            !! Macro for `sdl_upper_blit_scaled()`, as defined in `SDL_surface.h`.
            use, intrinsic :: iso_c_binding
            use :: sdl2_types
            implicit none
            type(sdl_surface), intent(in) :: src
            type(sdl_rect),    intent(in) :: src_rect
            type(sdl_surface), intent(in) :: dst
            type(sdl_rect),    intent(in) :: dst_rect
            integer(kind=c_int)           :: sdl_blit_scaled

            sdl_blit_scaled = sdl_upper_blit_scaled(src, src_rect, dst, dst_rect)
        end function sdl_blit_scaled

        ! int SDL_BlitSurface(SDL_Surface *src, const SDL_Rect *srcrect, SDL_Surface *dst, SDL_Rect *dstrect)
        function sdl_blit_surface(src, src_rect, dst, dst_rect)
            !! Macro for `sdl_upper_blit()`, as defined in `SDL_surface.h`.
            use, intrinsic :: iso_c_binding
            use :: sdl2_types
            implicit none
            type(sdl_surface), intent(in) :: src
            type(sdl_rect),    intent(in) :: src_rect
            type(sdl_surface), intent(in) :: dst
            type(sdl_rect),    intent(in) :: dst_rect
            integer(kind=c_int)           :: sdl_blit_surface

            sdl_blit_surface = sdl_upper_blit(src, src_rect, dst, dst_rect)
        end function sdl_blit_surface

        ! SDL_Surface *SDL_ConvertSurface(SDL_Surface *src, const SDL_PixelFormat *fmt, Uint32 flags)
        function sdl_convert_surface(src, fmt, flags)
            !! Calls `sdl_convert_surface_()` and converts the returned
            !! C pointer to derived type `sdl_surface`.
            use, intrinsic :: iso_c_binding
            use :: sdl2_types
            implicit none
            type(sdl_surface),       intent(in) :: src
            type(sdl_pixel_format),  intent(in) :: fmt
            integer(kind=c_int32_t), intent(in) :: flags
            type(sdl_surface),       pointer    :: sdl_convert_surface
            type(c_ptr)                         :: ptr

            ptr = sdl_convert_surface_(src, fmt, flags)
            call c_f_pointer(ptr, sdl_convert_surface)
        end function sdl_convert_surface

        ! const char *SDL_GetError(void)
        function sdl_get_error()
            !! Calls `sdl_get_error_()` and converts the returned
            !! C char pointer to Fortran character.
            use, intrinsic :: iso_c_binding
            implicit none
            character(len=100)              :: sdl_get_error
            type(c_ptr)                     :: ptr
            character(kind=c_char), pointer :: ptrs(:)
            integer                         :: i

            ptr = sdl_get_error_()
            call c_f_pointer(ptr, ptrs, shape=[len(sdl_get_error)])

            do i = 1, size(ptrs)
                sdl_get_error(i:i) = ptrs(i)
            end do
        end function sdl_get_error

        function sdl_get_keyboard_state()
            !! Calls `sdl_get_keyboard_state_()` and converts the returned
            !! C pointer to Fortran pointers.
            use, intrinsic :: iso_c_binding
            implicit none
            integer(kind=c_int8_t), pointer :: sdl_get_keyboard_state(:)
            type(c_ptr)                     :: ptr

            ptr = sdl_get_keyboard_state_(c_null_ptr)
            call c_f_pointer(ptr, sdl_get_keyboard_state, shape=[244])
        end function sdl_get_keyboard_state

        ! const char *SDL_GetHint(const char *name)
        function sdl_get_hint(name)
            !! Calls `sdl_get_hint_()` and converts the returned
            !! C char pointer to Fortran character.
            use, intrinsic :: iso_c_binding
            implicit none
            character(len=*),       intent(in) :: name
            character(len=100)                 :: sdl_get_hint
            type(c_ptr)                        :: ptr
            character(kind=c_char), pointer    :: ptrs(:)
            integer                            :: i

            ptr = sdl_get_hint_(name // c_null_char)
            call c_f_pointer(ptr, ptrs, shape=[len(sdl_get_hint)])

            do i = 1, size(ptrs)
                sdl_get_hint(i:i) = ptrs(i)
            end do
        end function sdl_get_hint

        function sdl_get_pixel_format(surface)
            !! Converts the *SDL_PixelFormat pointer inside `surface`
            !! to `sdl_pixel_format`.
            use, intrinsic :: iso_c_binding
            use :: sdl2_types
            implicit none
            type(sdl_surface),      intent(in) :: surface
            type(sdl_pixel_format), pointer    :: sdl_get_pixel_format

            call c_f_pointer(surface%format, sdl_get_pixel_format)
        end function

        ! SDL_Texture *SDL_GetRenderTarget(SDL_Renderer *renderer)
        function sdl_get_render_target(renderer) bind(c, name='SDL_GetRenderTarget')
            use, intrinsic :: iso_c_binding
            implicit none
            type(c_ptr), intent(in), value :: renderer
            type(c_ptr)                    :: sdl_get_render_target
        end function sdl_get_render_target

        ! SDL_Surface *SDL_GetWindowSurface(SDL_Window *window)
        function sdl_get_window_surface(window)
            !! Calls `sdl_get_window_surface_()` and converts the returned
            !! C pointer to derived type `sdl_surface`.
            use, intrinsic :: iso_c_binding
            use :: sdl2_types
            implicit none
            type(c_ptr),       intent(in) :: window
            type(sdl_surface), pointer    :: sdl_get_window_surface
            type(c_ptr)                   :: ptr

            ptr = sdl_get_window_surface_(window)
            call c_f_pointer(ptr, sdl_get_window_surface)
        end function sdl_get_window_surface

        ! SDL_Surface *SDL_LoadBMP(const char *file)
        function sdl_load_bmp(file)
            !! Calls `sdl_load_bmp_rw()` and converts the returned
            !! C pointer to derived type `sdl_surface`.
            use, intrinsic :: iso_c_binding
            use :: sdl2_types
            implicit none
            character(kind=c_char), intent(in) :: file
            type(sdl_surface),      pointer    :: sdl_load_bmp
            type(c_ptr)                        :: ptr

            ptr = sdl_load_bmp_rw(sdl_rw_from_file(file, 'rb' // c_null_char), 1)
            call c_f_pointer(ptr, sdl_load_bmp)
        end function sdl_load_bmp

        ! int SDL_PollEvent(SDL_Event *event)
        function sdl_poll_event(event)
            !! Calls `sdl_poll_event_()` and transfers the returned
            !! union to the respective event type.
            use, intrinsic :: iso_c_binding
            use :: sdl2_consts
            use :: sdl2_types
            implicit none
            type(sdl_event), intent(in out) :: event
            integer                         :: sdl_poll_event

            sdl_poll_event = sdl_poll_event_(event)
            call sdl_transfer_event(event)
        end function sdl_poll_event

        ! SDL_bool SDL_SetHint(const char *name, const char *value)
        function sdl_set_hint(name, value)
            !! Adds `c_null_char` to name and value before calling
            !! `sdl_set_hint_()`.
            use, intrinsic :: iso_c_binding
            implicit none
            character(len=*) :: name
            character(len=*) :: value
            integer          :: sdl_set_hint

            sdl_set_hint = sdl_set_hint_(name // c_null_char, value // c_null_char)
        end function sdl_set_hint

        ! int SDL_WaitEvent(SDL_Event *event)
        function sdl_wait_event(event)
            !! Calls `sdl_wait_event_()` and transfers the returned
            !! union to the respective event type.
            use, intrinsic :: iso_c_binding
            use :: sdl2_consts
            use :: sdl2_types
            implicit none
            type(sdl_event), intent(in out) :: event
            integer                         :: sdl_wait_event

            sdl_wait_event = sdl_wait_event_(event)
            call sdl_transfer_event(event)
        end function sdl_wait_event

        subroutine sdl_transfer_event(event)
            !! Transfers a given event union to the respective event type
            !! (since there are no unions in Fortran).
            use, intrinsic :: iso_c_binding
            use :: sdl2_consts
            use :: sdl2_types
            type(sdl_event), intent(in out) :: event

            select case (event%type)
                ! SDL_WindowEvent
                case (sdl_window)
                    event%window = transfer(event, event%window)

                ! SDL_KeyboardEvent
                case (sdl_key_down : sdl_key_up)
                    event%key = transfer(event, event%key)

                ! SDL_TextEditingEvent
                case (sdl_text_editing)
                    event%edit = transfer(event, event%edit)

                ! SDL_TextInputEvent
                case (sdl_text_input)
                    event%text = transfer(event, event%text)

                ! SDL_MouseMotionEvent
                case (sdl_mouse_motion)
                    event%motion = transfer(event, event%motion)

                ! SDL_MouseButtonEvent
                case (sdl_mouse_button_down : sdl_mouse_button_up)
                    event%button = transfer(event, event%button)

                ! SDL_MouseWheelEvent
                case (sdl_mouse_wheel)
                    event%wheel = transfer(event, event%wheel)

                ! SDL_JoyAxisEvent
                case (sdl_joy_axis_motion)
                    event%j_axis = transfer(event, event%j_axis)

                ! SDL_JoyBallEvent
                case (sdl_joy_ball_motion)
                    event%j_ball = transfer(event, event%j_ball)

                ! SDL_JoyHatEvent
                case (sdl_joy_hat_motion)
                    event%j_hat = transfer(event, event%j_hat)

                ! SDL_JoyButtonEvent
                case (sdl_joy_button_down : sdl_joy_button_up)
                    event%j_button = transfer(event, event%j_button)

                ! SDL_JoyDeviceEvent
                case (sdl_joy_device_added : sdl_joy_device_removed)
                    event%j_device = transfer(event, event%j_device)

                ! SDL_ControllerAxisEvent
                case (sdl_controller_axis_motion)
                    event%c_axis = transfer(event, event%c_axis)

                ! SDL_ControllerButtonEvent
                case (sdl_controller_button_down : sdl_controller_button_up)
                    event%c_button = transfer(event, event%c_button)

                ! SDL_ControllerDeviceEvent
                case (sdl_controller_device_added : sdl_controller_device_remapped)
                    event%c_device = transfer(event, event%c_device)

                ! SDL_AudioDeviceEvent
                case (sdl_audio_device_added : sdl_audio_device_removed)
                    event%a_device = transfer(event, event%a_device)

                ! SDL_QuitEvent
                case (sdl_quit_type)
                    event%quit = transfer(event, event%quit)

                ! SDL_UserEvent
                case (sdl_user)
                    event%user = transfer(event, event%user)

                ! SDL_SysWMEvent
                case (sdl_sys_wm)
                    event%sys_wm = transfer(event, event%sys_wm)

                ! SDL_TouchFingerEvent
                case (sdl_finger_down : sdl_finger_motion)
                    event%t_finger = transfer(event, event%t_finger)

                ! SDL_MultiGestureEvent
                case (sdl_multi_gesture)
                    event%m_gesture = transfer(event, event%m_gesture)

                ! SDL_DollarGestureEvent
                case (sdl_dollar_gesture : sdl_dollar_record)
                    event%d_gesture = transfer(event, event%d_gesture)

                ! SDL_DropEvent
                case (sdl_drop_file : sdl_drop_complete)
                    event%drop = transfer(event, event%drop)
            end select
        end subroutine sdl_transfer_event
end module sdl2
