object fmMultipleChoice: TfmMultipleChoice
  Left = 205
  Top = 115
  BorderStyle = bsDialog
  Caption = 'Click on the rigth kanji'
  ClientHeight = 379
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Mincho'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 11
  object Bevel1: TBevel
    Left = 504
    Top = 7
    Width = 103
    Height = 37
  end
  object sbHide: TSpeedButton
    Left = 512
    Top = 13
    Width = 25
    Height = 25
    Hint = 'Hide on right'
    AllowAllUp = True
    GroupIndex = 1
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      300033FFFFFF3333377739999993333333333777777F3333333F399999933333
      3300377777733333337733333333333333003333333333333377333333333333
      3333333333333333333F333333333333330033333F33333333773333C3333333
      330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
      993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
      333333377F33333333FF3333C333333330003333733333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
  end
  object sbShowanswer: TSpeedButton
    Left = 541
    Top = 13
    Width = 25
    Height = 25
    Hint = 'Show right answer on wrong'
    AllowAllUp = True
    GroupIndex = 2
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
      0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
      00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
      00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
      F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
      F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
      FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
      0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
      00337777FFFF77FF7733EEEE0000000003337777777777777333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
  end
  object lbHelp: TLabel
    Left = 376
    Top = 40
    Width = 36
    Height = 11
    Caption = 'lbHelp'
    Visible = False
  end
  object sbWaitforright: TSpeedButton
    Left = 571
    Top = 13
    Width = 25
    Height = 25
    Hint = 'Wait for right answer'
    AllowAllUp = True
    GroupIndex = 2
    Down = True
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
      0EEE333377777777777733330FF00FBFB0EE33337F37733F377733330F0BFB0B
      FB0E33337F73FF73337733330FF000BFBFB033337F377733333733330FFF0BFB
      FBF033337FFF733F333733300000BF0FBFB03FF77777F3733F37000FBFB0F0FB
      0BF077733FF7F7FF7337E0FB00000000BF0077F377777777F377E0BFBFBFBFB0
      F0F077F3333FFFF7F737E0FBFB0000000FF077F3337777777337E0BFBFBFBFB0
      FFF077F3333FFFF73FF7E0FBFB00000F000077FF337777737777E00FBFBFB0FF
      0FF07773FFFFF7337F37003000000FFF0F037737777773337F7333330FFFFFFF
      003333337FFFFFFF773333330000000003333333777777777333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
  end
  object QuestionPanel: TPanel
    Left = 16
    Top = 13
    Width = 473
    Height = 25
    BevelOuter = bvNone
    Color = clBlack
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    PopupMenu = Form1.FontPopupMenu1
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 360
    Width = 622
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = 'Right: 0'
        Width = 70
      end
      item
        Alignment = taCenter
        Text = 'Wrong: 0'
        Width = 70
      end
      item
        Alignment = taCenter
        Text = 'Kanji left: 0'
        Width = 90
      end
      item
        Width = 50
      end>
  end
  object ScrollBox1: TScrollBox
    Left = 8
    Top = 50
    Width = 601
    Height = 305
    VertScrollBar.Increment = 72
    VertScrollBar.Style = ssFlat
    Color = clBlack
    ParentColor = False
    TabOrder = 2
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 300
    OnTimer = Timer1Timer
    Left = 16
    Top = 96
  end
  object PopupMenu1: TPopupMenu
    Left = 16
    Top = 58
    object Font1: TMenuItem
      Caption = 'Font...'
      OnClick = Font1Click
    end
  end
  object FontDialog1: TFontDialog
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Mincho'
    Font.Style = []
    Left = 48
    Top = 58
  end
end
