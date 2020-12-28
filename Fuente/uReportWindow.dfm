object fmReportWindow: TfmReportWindow
  Left = 192
  Top = 107
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Wrong Answers Report'
  ClientHeight = 198
  ClientWidth = 304
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Tag = 1
    Left = 40
    Top = 160
    Width = 23
    Height = 22
    Caption = '...'
    Flat = True
    Visible = False
    OnClick = SpeedButton1Click
  end
  object Bevel1: TBevel
    Left = 0
    Top = 152
    Width = 304
    Height = 46
    Align = alBottom
  end
  object SpeedButton2: TSpeedButton
    Left = 216
    Top = 72
    Width = 23
    Height = 22
  end
  object SpeedButton3: TSpeedButton
    Left = 216
    Top = 112
    Width = 23
    Height = 22
  end
  object edReportName: TLabeledEdit
    Tag = 1
    Left = 16
    Top = 24
    Width = 273
    Height = 21
    EditLabel.Width = 66
    EditLabel.Height = 13
    EditLabel.Caption = 'Report Name:'
    TabOrder = 0
    Text = 'Goi32 wrong answers report'
  end
  object BitBtn1: TBitBtn
    Left = 208
    Top = 160
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 120
    Top = 160
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object LabeledEdit1: TLabeledEdit
    Left = 16
    Top = 72
    Width = 177
    Height = 21
    EditLabel.Width = 26
    EditLabel.Height = 13
    EditLabel.Caption = 'From:'
    TabOrder = 3
  end
  object LabeledEdit2: TLabeledEdit
    Left = 16
    Top = 112
    Width = 177
    Height = 21
    EditLabel.Width = 16
    EditLabel.Height = 13
    EditLabel.Caption = 'To:'
    TabOrder = 4
  end
end
