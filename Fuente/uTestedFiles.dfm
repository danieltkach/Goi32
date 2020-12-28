object fmTestedFiles: TfmTestedFiles
  Left = 439
  Top = 165
  BorderStyle = bsDialog
  Caption = 'No file selected'
  ClientHeight = 410
  ClientWidth = 487
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 372
    Width = 487
    Height = 38
    Align = alBottom
    ExplicitTop = 245
    ExplicitWidth = 449
  end
  object ListView1: TListView
    Left = 0
    Top = 23
    Width = 487
    Height = 333
    Align = alClient
    Columns = <
      item
        Caption = 'File description'
        ImageIndex = 1
        MinWidth = 200
        Width = 250
      end
      item
        Alignment = taCenter
        Caption = 'Result'
        ImageIndex = 2
        MaxWidth = 70
        MinWidth = 70
        Width = 70
      end
      item
        Alignment = taCenter
        Caption = 'Last tested'
        ImageIndex = 3
        MaxWidth = 140
        MinWidth = 140
        Width = 140
      end>
    ColumnClick = False
    FlatScrollBars = True
    GridLines = True
    LargeImages = ImageList1
    ReadOnly = True
    SmallImages = ImageList1
    TabOrder = 0
    ViewStyle = vsReport
    OnChange = ListView1Change
    OnClick = ListView1Click
    OnColumnClick = ListView1ColumnClick
    OnCompare = ListView1Compare
    OnDblClick = btLoadClick
    OnSelectItem = ListView1SelectItem
  end
  object btLoad: TBitBtn
    Left = 418
    Top = 378
    Width = 65
    Height = 25
    Caption = 'Load'
    DoubleBuffered = True
    Enabled = False
    Kind = bkOK
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = btLoadClick
  end
  object btClose: TBitBtn
    Left = 347
    Top = 378
    Width = 65
    Height = 25
    Caption = 'Close'
    DoubleBuffered = True
    Kind = bkCancel
    ParentDoubleBuffered = False
    TabOrder = 2
  end
  object btClear: TBitBtn
    Left = 62
    Top = 378
    Width = 50
    Height = 25
    Caption = 'Clear'
    DoubleBuffered = True
    Enabled = False
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = btClearClick
  end
  object btClean: TBitBtn
    Left = 14
    Top = 212
    Width = 50
    Height = 25
    Caption = 'Clean'
    DoubleBuffered = True
    Enabled = False
    ParentDoubleBuffered = False
    TabOrder = 4
    Visible = False
    OnClick = btCleanClick
  end
  object btDelete: TBitBtn
    Left = 8
    Top = 378
    Width = 50
    Height = 25
    Caption = 'Delete'
    DoubleBuffered = True
    Enabled = False
    ParentDoubleBuffered = False
    TabOrder = 5
    OnClick = btDeleteClick
  end
  object Panel1: TPanel
    Left = 53
    Top = 70
    Width = 409
    Height = 209
    TabOrder = 6
    Visible = False
    object Bevel2: TBevel
      Left = 10
      Top = 63
      Width = 279
      Height = 135
    end
    object Edit1: TEdit
      Left = 16
      Top = 24
      Width = 266
      Height = 21
      TabOrder = 0
      Text = 'c:\Goi32\'
    end
    object Button1: TButton
      Left = 302
      Top = 108
      Width = 43
      Height = 21
      Caption = 'Open'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 302
      Top = 140
      Width = 75
      Height = 25
      Caption = 'Read'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Edit2: TEdit
      Left = 16
      Top = 72
      Width = 266
      Height = 21
      TabOrder = 3
    end
    object Edit3: TEdit
      Left = 16
      Top = 96
      Width = 266
      Height = 21
      TabOrder = 4
    end
    object Edit4: TEdit
      Left = 16
      Top = 120
      Width = 266
      Height = 21
      TabOrder = 5
    end
    object Edit5: TEdit
      Left = 16
      Top = 144
      Width = 266
      Height = 21
      TabOrder = 6
    end
    object Button4: TButton
      Left = 351
      Top = 108
      Width = 42
      Height = 21
      Caption = 'Close'
      TabOrder = 7
      OnClick = Button4Click
    end
    object Button2: TButton
      Left = 302
      Top = 172
      Width = 75
      Height = 25
      Caption = 'Write'
      TabOrder = 8
      OnClick = Button2Click
    end
    object Edit6: TEdit
      Left = 16
      Top = 168
      Width = 266
      Height = 21
      TabOrder = 9
    end
    object BitBtn2: TBitBtn
      Left = 301
      Top = 23
      Width = 80
      Height = 25
      Caption = 'Del non active'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 10
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 302
      Top = 77
      Width = 43
      Height = 21
      Caption = 'Rights'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 11
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 351
      Top = 77
      Width = 42
      Height = 21
      Caption = 'Wrongs'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 12
      OnClick = BitBtn4Click
    end
  end
  object BitBtn1: TBitBtn
    Left = 223
    Top = 378
    Width = 75
    Height = 25
    Caption = 'Repair-Panel'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 7
    Visible = False
    OnClick = BitBtn1Click
  end
  object btDetails: TBitBtn
    Left = 116
    Top = 378
    Width = 50
    Height = 25
    Caption = 'Details'
    DoubleBuffered = True
    Enabled = False
    ParentDoubleBuffered = False
    TabOrder = 8
    OnClick = btDetailsClick
  end
  object btJoin: TBitBtn
    Left = 171
    Top = 378
    Width = 50
    Height = 25
    Caption = 'Join'
    DoubleBuffered = True
    Enabled = False
    ParentDoubleBuffered = False
    TabOrder = 9
    OnClick = btJoinClick
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 356
    Width = 487
    Height = 16
    Align = alBottom
    Smooth = True
    TabOrder = 10
    Visible = False
  end
  object tempListbox: TCheckListBox
    Left = 359
    Top = 26
    Width = 50
    Height = 100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 11
    Visible = False
  end
  object Listbox1: TCheckListBox
    Left = 48
    Top = 139
    Width = 100
    Height = 100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 12
    Visible = False
  end
  object Listbox2: TCheckListBox
    Left = 148
    Top = 139
    Width = 100
    Height = 100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 13
    Visible = False
  end
  object Listbox3: TCheckListBox
    Left = 248
    Top = 139
    Width = 100
    Height = 100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 14
    Visible = False
  end
  object Listbox4: TCheckListBox
    Left = 344
    Top = 139
    Width = 100
    Height = 100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 15
    Visible = False
  end
  object SummaryPanel: TPanel
    Left = 0
    Top = 0
    Width = 487
    Height = 23
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 16
    object lbWords1: TLabel
      Left = 103
      Top = 4
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label2: TLabel
      Left = 262
      Top = 4
      Width = 68
      Height = 13
      Caption = 'Oldest test on:'
      Visible = False
    end
    object Label3: TLabel
      Left = 147
      Top = 4
      Width = 69
      Height = 13
      Caption = 'Average mark:'
    end
    object Label1: TLabel
      Left = 14
      Top = 4
      Width = 83
      Height = 13
      Caption = 'Number of words:'
    end
    object lbAverages: TLabel
      Left = 222
      Top = 4
      Width = 6
      Height = 13
      Caption = '0'
    end
  end
  object ImageList1: TImageList
    Left = 72
    Top = 176
    Bitmap = {
      494C0101050009001C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF0000000000000000007F7F7F00000000007F7F7F00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF007F7F7F00000000007F7F7F000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF00000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF00000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080000000000000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000800000000000000080000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF0000000000000000007F7F7F00000000007F7F7F00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000BFFF000000FF0000BFFF000000FF0000BFFF000000000000000000
      0000000000000000000000000000000000000000008000000000000000800000
      0000000000800000000000000080000000000000008000000000000000800000
      00000000008000000000000000800000000000000000000000007F7F7F000000
      000000000000000000007F7F7F000000000000000000000000007F7F7F000000
      000000000000000000007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF0000BFFF000000FF0000BFFF00
      0000FF0000BFFF000000BFBFBF0000000000BFBFBFBFFF000000FF0000BFFF00
      0000FF0000BFFF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000800000
      00000000008000000000000000800000000000000000000000007F7F7F000000
      00007F7F7F00000000007F7F7F00000000007F7F7F00000000007F7F7F000000
      00007F7F7F00000000007F7F7F00000000000000000000000000FFFFFFBFFFFF
      FF00FFFFFFBFFFFFFF00FFFFFFBFFFFFFF00FFFFFFBFFFFFFF00FFFFFFBFFFFF
      FF00FFFFFF000000000000000000000000000000000000000000BFBFBFBFBFBF
      BF00BFBFBFBFBFBFBF000000003F7F7F7F00000000BFBFBFBF00BFBFBFBFBFBF
      BF00BFBFBF00000000000000000000000000000000000000000000FFFFBFBFBF
      BF0000FFFFBFBFBFBF0000FFFFBFBFBFBF0000FFFFBFBFBFBF0000FFFF000000
      0000000000000000000000000000000000007F7F7F3F7F7F7F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFBFFFFF
      FF00FFFFFF3F7F7F7F0000000000000000000000003F7F7F7F00FFFFFFBFFFFF
      FF00FFFFFF00000000000000000000000000000000BFFFFFFF000000003F7F7F
      7F007F7F7F0000000000FFFFFF3F7F7F7F00FFFFFF00000000007F7F7F3F7F7F
      7F00000000BFFFFFFF0000000000000000000000000000FFFF000000000000FF
      FF00BFBFBF0000FFFF00BFBFBF0000FFFF00BFBFBF0000FFFF00BFBFBF0000FF
      FF00000000BFFFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFBFFFFF
      FF00000000BFBFBFBF00FFFFFFBFFFFFFF00FFFFFFBFBFBFBF00000000BFFFFF
      FF00FFFFFF000000000000000000000000007F7F7F0000000000FFFFFFBFFFFF
      FF00FFFFFFBFFFFFFF00FFFFFF3F7F7F7F00FFFFFFBFFFFFFF00FFFFFFBFFFFF
      FF00FFFFFF00000000007F7F7F0000000000000000BFFFFFFF0000FFFF000000
      000000FFFFBFBFBFBF0000FFFFBFBFBFBF0000FFFFBFBFBFBF0000FFFFBFBFBF
      BF0000FFFF0000000000FFFFFF00000000000000003F7F7F7F00000000000000
      FF00000000000000000000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000FFFFFF3F7F7F
      7F00BFBFBFBFFFFFFF00FFFFFFBFFFFFFF00FFFFFFBFFFFFFF00BFBFBF3F7F7F
      7F00FFFFFF000000000000000000000000007F7F7F0000000000FFFFFFBFFFFF
      FF00FFFFFF0000FFFF000000FF000000FF00FFFFFF0000FFFF00FFFFFFBFFFFF
      FF00FFFFFF00000000007F7F7F00000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000FF00000000000000FF000000FF00000000BFFF000000000000BFFF00
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFFBFFFFFFF00FFFFFFBFFFFFFF00FFFFFFBFFFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFFBFFFFF
      FF0000FFFFBFFFFFFF000000FF000000FF0000FFFFBFFFFFFF0000FFFFBFFFFF
      FF00FFFFFF00000000000000000000000000000000BFFFFFFF0000FFFFBFFFFF
      FF0000FFFFBFFFFFFF00000000BFFFFFFF00FFFFFFBFFFFFFF00FFFFFFBFFFFF
      FF00FFFFFFBFFFFFFF00FFFFFF00000000007F7F7F3F7F7F7F000000003F7F7F
      7F000000FF3F7F7F7F000000FF3F7F7F7F000000FF3F7F7F7F007F7F7FBFFF00
      00007F7F7F3F7F7F7F007F7F7F3F7F7F7F000000000000000000FFFFFF000000
      0000FFFFFFBFFFFFFF00FFFFFF000000FF000000000000000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000003F7F7F7F000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF3F7F7F7F00FFFFFF0000FFFF00FFFFFF0000FF
      FF000000003F7F7F7F0000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00000000BFFFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000FF0000000000000000000000
      0000FF0000000000000000000000000000000000000000000000FFFFFF000000
      0000FFFFFFBFFFFFFF00FFFFFF0000000000FFFFFFBFFFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000000000000000003F7F7F7F00000000BFFFFF
      FF0000FFFFBFFFFFFF000000FFBFBFBFBF0000FFFFBFFFFFFF0000FFFFBFFFFF
      FF000000003F7F7F7F000000000000000000000000BFFFFFFF0000FFFFBFFFFF
      FF0000FFFFBFFFFFFF00000000BFFFFFFF00FFFFFFBFFFFFFF00FFFFFFBFFFFF
      FF00FFFFFFBFFFFFFF00FFFFFF00000000000000003F7F7F7F00000000BFFF00
      00000000000000000000000000BFFF000000000000000000FF00000000000000
      00000000FF000000000000000000000000000000000000000000FFFFFF3F7F7F
      7F00BFBFBFBFFFFFFF00FFFFFF0000000000FFFFFFBFFFFFFF00BFBFBF3F7F7F
      7F00FFFFFF000000000000000000000000000000000000FFFF000000000000FF
      FF00FFFFFF0000FFFF000000FF000000FF000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00000000BFFFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000FF00000000000000FF00000000000000000000000000FF00000000000000
      FF00FF0000000000FF0000000000000000000000000000000000FFFFFFBFFFFF
      FF00000000BFBFBFBF00FFFFFF0000000000FFFFFFBFBFBFBF00000000BFFFFF
      FF00FFFFFF00000000000000000000000000000000BFFFFFFF0000FFFF000000
      0000000000000000000000FFFF000000FF000000FF0000000000000000000000
      000000FFFF000000000000000000000000000000003F7F7F7F00000000000000
      00000000000000000000000000BFFFFFFF00FFFFFFBFFFFFFF00FFFFFFBFFFFF
      FF00FFFFFFBFFFFFFF00FFFFFF00000000007F7F7F3F7F7F7F000000003F7F7F
      7F00FF00003F7F7F7F00FF00003F7F7F7F007F7F7F3F7F7F7F000000FF3F7F7F
      7F007F7F7FBFFF0000000000FF3F7F7F7F000000000000000000FFFFFFBFFFFF
      FF00FFFFFF3F7F7F7F0000000000000000000000003F7F7F7F00FFFFFFBFFFFF
      FF00FFFFFF000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000FF000000FF00FFFFFF0000FF
      FF00FFFFFF000000000000000000000000000000008000000000000000800000
      00000000008000000000000000BFFFFFFF000000000000000000FFFFFFBFFFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000BFFF00000000000000000000000000000000000000000000000000
      0000000000BFFF00000000000000000000000000000000000000FFFFFFBFFFFF
      FF00FFFFFFBFFFFFFF00FFFFFFBFFFFFFF00FFFFFFBFFFFFFF00000000000000
      000000000000000000000000000000000000000000BFFFFFFF0000FFFFBFFFFF
      FF000000FF000000FF0000FFFFBFFFFFFF000000FF000000FF0000FFFFBFFFFF
      FF0000FFFF000000000000000000000000000000008000000000000000800000
      00000000008000000000000000BFFFFFFF00FFFFFFBFFFFFFF00FFFFFFBFFFFF
      FF00000000BFFFFFFF0000000080000000000000003F7F7F7F00000000000000
      0000000000BFFF00000000000000000000000000000000000000000000000000
      00000000000000000000FF000000000000000000000000000000FFFFFFBFFFFF
      FF00FFFFFFBFFFFFFF00FFFFFFBFFFFFFF00FFFFFFBFFFFFFF00000000BFFFFF
      FF00FFFFFF000000000000000000000000000000000000000000FFFFFF0000FF
      FF000000FF000000FF00FFFFFF0000FFFF000000FF000000FF00FFFFFF0000FF
      FF00000000000000000000000000000000000000008000000000000000800000
      00000000008000000000000000BFFFFFFF00FFFFFFBFFFFFFF00FFFFFFBFFFFF
      FF00000000000000000000000080000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00000000BFFFFF
      FF00000000000000000000000000000000000000000000000000000000BFFFFF
      FF0000FFFF000000FF000000FF000000FF000000FFBFFFFFFF0000FFFF000000
      0000000000000000000000000000000000000000008000000000000000800000
      0000000000800000000000000000000000000000000000000000000000000000
      0000000000800000000000000080000000007F7F7F3F7F7F7F000000003F7F7F
      7F007F7F7F3F7F7F7F007F7F7F3F7F7F7F007F7F7F3F7F7F7F007F7F7F3F7F7F
      7F007F7F7F3F7F7F7F007F7F7F3F7F7F7F000000000000000000FFFFFFBFFFFF
      FF00FFFFFFBFFFFFFF00FFFFFFBFFFFFFF00FFFFFFBFFFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000800000
      0000000000800000000000000080000000000000008000000000000000800000
      0000000000800000000000000080000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      C631000000000000E223000000000000F007000000000000F88F000000000000
      FC1F000000000000FE3F000000000000FC1F000000000000F80F000000000000
      F007000000000000E223000000000000C631000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000F83FFFFFDDDD80030001801FD5558003
      000100000000800300010000DFFF8003000100008FDF800300010000D4AF8003
      800300000000800380030000DB778003800300008EB7800380078000D5A38003
      80078000000080038007FC00DBFB80038007FC019BFD8003C00FFC03DFFF8007
      E01FFC070000800FF03FFFFFFFFF801F00000000000000000000000000000000
      000000000000}
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'goi'
    Left = 8
    Top = 184
  end
end
