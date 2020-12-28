object fmDirectories: TfmDirectories
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  ClientHeight = 327
  ClientWidth = 236
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 288
    Width = 236
    Height = 39
    Align = alBottom
  end
  object DirectoryListBox1: TDirectoryListBox
    Left = 4
    Top = 32
    Width = 227
    Height = 248
    ItemHeight = 16
    TabOrder = 0
  end
  object DriveComboBox1: TDriveComboBox
    Left = 4
    Top = 8
    Width = 227
    Height = 19
    DirList = DirectoryListBox1
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 144
    Top = 296
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 56
    Top = 296
    Width = 75
    Height = 25
    TabOrder = 3
    Kind = bkCancel
  end
end
