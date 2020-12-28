object fmToKanji: TfmToKanji
  Left = 269
  Top = 109
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Draw the Kanji'
  ClientHeight = 223
  ClientWidth = 296
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 193
    Top = 42
    Width = 89
    Height = 140
  end
  object lbHelp: TLabel
    Left = 5
    Top = 189
    Width = 287
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Color = clSilver
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Mincho'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object KanjiPanel: TPanel
    Left = 17
    Top = 42
    Width = 141
    Height = 141
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Color = clGray
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clBlack
    Font.Height = -100
    Font.Name = 'MS Mincho'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object btShowkanji: TBitBtn
    Left = 200
    Top = 51
    Width = 75
    Height = 25
    Caption = 'Show'
    Default = True
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = btShowkanjiClick
  end
  object btWasright: TBitBtn
    Left = 200
    Top = 115
    Width = 75
    Height = 25
    Caption = 'Correct!'
    Default = True
    DoubleBuffered = True
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 2
    OnClick = btWasrightClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 204
    Width = 296
    Height = 19
    Panels = <
      item
        Text = 'Right: 0'
        Width = 70
      end
      item
        Text = 'Wrong: 0'
        Width = 70
      end
      item
        Alignment = taRightJustify
        Text = 'Left: 0 '
        Width = 50
      end>
  end
  object btWaswrong: TBitBtn
    Left = 200
    Top = 147
    Width = 75
    Height = 25
    Caption = 'Wrong!'
    DoubleBuffered = True
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 4
    OnClick = btWaswrongClick
  end
  object ReadingPanel: TPanel
    Left = 8
    Top = 8
    Width = 279
    Height = 25
    BevelOuter = bvNone
    Color = clBlack
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Mincho'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object cbHelp: TCheckBox
    Left = 208
    Top = 83
    Width = 48
    Height = 17
    Caption = 'Help'
    TabOrder = 6
    OnClick = cbHelpClick
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 350
    OnTimer = Timer1Timer
    Left = 16
    Top = 16
  end
end
