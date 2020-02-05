object FCodex: TFCodex
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 0
  ClientWidth = 0
  Color = clBackground
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clYellow
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid: TStringGrid
    Left = 0
    Top = 0
    Width = 0
    Height = 0
    Cursor = crArrow
    ParentCustomHint = False
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    ColCount = 500
    Ctl3D = False
    DefaultColWidth = 20
    DefaultRowHeight = 20
    DrawingStyle = gdsClassic
    FixedColor = clBackground
    FixedCols = 0
    RowCount = 80
    FixedRows = 0
    Font.Charset = HEBREW_CHARSET
    Font.Color = clYellow
    Font.Height = -11
    Font.Name = 'Times New Roman'
    Font.Style = []
    GradientEndColor = clYellow
    GradientStartColor = clOlive
    GridLineWidth = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
    ParentColor = True
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ScrollBars = ssNone
    ShowHint = False
    TabOrder = 0
  end
  object TimerScrollDown: TTimer
    Interval = 200
    OnTimer = TimerScrollDownTimer
    Left = 8
    Top = 8
  end
  object TimerCharChange: TTimer
    Interval = 200
    OnTimer = TimerCharChangeTimer
    Left = 48
    Top = 8
  end
  object TimerStartLine: TTimer
    Interval = 267
    OnTimer = TimerStartLineTimer
    Left = 8
    Top = 56
  end
  object TimerSpeedy: TTimer
    Interval = 100
    OnTimer = TimerSpeedyTimer
    Left = 48
    Top = 56
  end
  object WavePlayerShumman: TJvWavePlayer
    Loop = True
    Left = 48
    Top = 104
  end
  object WavePlayerMusic: TJvWavePlayer
    Loop = True
    Left = 48
    Top = 152
  end
  object TimerControl: TTimer
    Enabled = False
    Left = 160
    Top = 8
  end
end
