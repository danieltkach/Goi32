object fmText: TfmText
  Left = 221
  Top = 160
  ClientHeight = 426
  ClientWidth = 461
  Color = clBtnFace
  Constraints.MinHeight = 380
  Constraints.MinWidth = 425
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 385
    Width = 461
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    ExplicitTop = 305
    DesignSize = (
      461
      41)
    object BitBtn1: TBitBtn
      Left = 371
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight, akBottom]
      DoubleBuffered = True
      Kind = bkOK
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object btClear: TBitBtn
      Left = 14
      Top = 8
      Width = 57
      Height = 25
      Caption = 'Clear'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btClearClick
    end
    object BitBtn2: TBitBtn
      Left = 77
      Top = 8
      Width = 91
      Height = 25
      Caption = 'Averages report'
      DoubleBuffered = True
      Enabled = False
      ParentDoubleBuffered = False
      TabOrder = 2
    end
  end
  object RichEdit1: TRichEdit
    Left = 0
    Top = 0
    Width = 461
    Height = 385
    Cursor = crHandPoint
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
    ExplicitHeight = 305
  end
end
