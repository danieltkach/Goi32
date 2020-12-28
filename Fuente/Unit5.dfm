object ConfigForm: TConfigForm
  Left = 196
  Top = 114
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Configuration'
  ClientHeight = 293
  ClientWidth = 420
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
    Top = 253
    Width = 420
    Height = 40
    Align = alBottom
    ExplicitTop = 246
  end
  object Panel1: TPanel
    Left = 3
    Top = 8
    Width = 411
    Height = 237
    BevelInner = bvLowered
    TabOrder = 2
    object SpeedButton2: TSpeedButton
      Tag = 1
      Left = 209
      Top = 18
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Tag = 2
      Left = 209
      Top = 58
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Tag = 3
      Left = 209
      Top = 102
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = SpeedButton4Click
    end
    object edAppPath: TLabeledEdit
      Tag = 1
      Left = 12
      Top = 19
      Width = 191
      Height = 21
      EditLabel.Width = 79
      EditLabel.Height = 13
      EditLabel.Caption = 'Application path:'
      TabOrder = 0
      Text = 'C:\Goi32\'
    end
    object edVocPath: TLabeledEdit
      Tag = 2
      Left = 12
      Top = 59
      Width = 191
      Height = 21
      EditLabel.Width = 80
      EditLabel.Height = 13
      EditLabel.Caption = 'Vocabulary path:'
      TabOrder = 1
      Text = 'c:\Goi32\Vocabulary\'
    end
    object edEssKPath: TLabeledEdit
      Tag = 3
      Left = 12
      Top = 103
      Width = 191
      Height = 21
      EditLabel.Width = 92
      EditLabel.Height = 13
      EditLabel.Caption = 'Essential Kanji path'
      TabOrder = 2
      Text = 'c:\Goi32\Essential Kanji\'
    end
    object GroupBox1: TGroupBox
      Left = 245
      Top = 17
      Width = 158
      Height = 104
      Caption = 'Retest wrong answers'
      TabOrder = 3
      object Label1: TLabel
        Left = 8
        Top = 27
        Width = 26
        Height = 13
        Caption = 'every'
      end
      object Label2: TLabel
        Left = 87
        Top = 27
        Width = 65
        Height = 13
        Caption = 'right answers.'
      end
      object Label3: TLabel
        Left = 86
        Top = 68
        Width = 28
        Height = 13
        Caption = 'words'
      end
      object Edit1: TEdit
        Left = 40
        Top = 24
        Width = 25
        Height = 21
        TabOrder = 0
        Text = '4'
        OnChange = Edit1Change
      end
      object UpDown1: TUpDown
        Left = 65
        Top = 24
        Width = 16
        Height = 21
        Associate = Edit1
        Min = 1
        Max = 10
        Position = 4
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 12
      Top = 144
      Width = 158
      Height = 81
      Caption = 'Goi files creation'
      TabOrder = 4
      object chkDontcopylistfiles: TCheckBox
        Left = 15
        Top = 46
        Width = 116
        Height = 17
        Caption = 'Do not copy list files'
        Enabled = False
        TabOrder = 0
      end
      object chkDelListFiles1: TCheckBox
        Left = 15
        Top = 22
        Width = 97
        Height = 17
        Hint = 
          'Check this box if you want the program to delete from their curr' +
          'ent folder the files you load when you create a .goi file'
        Caption = 'Delete list files'
        Checked = True
        Enabled = False
        State = cbChecked
        TabOrder = 1
      end
    end
    object GroupBox3: TGroupBox
      Left = 198
      Top = 144
      Width = 199
      Height = 81
      Caption = 'Language for tests'
      TabOrder = 5
      object RadioButton1: TRadioButton
        Left = 24
        Top = 24
        Width = 113
        Height = 17
        Caption = 'Japanese'
        Checked = True
        Enabled = False
        TabOrder = 0
        TabStop = True
      end
      object RadioButton2: TRadioButton
        Left = 24
        Top = 47
        Width = 113
        Height = 17
        Caption = 'Sanskrit'
        Enabled = False
        TabOrder = 1
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 345
    Top = 262
    Width = 66
    Height = 25
    DoubleBuffered = True
    Kind = bkOK
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 265
    Top = 262
    Width = 70
    Height = 25
    DoubleBuffered = True
    Kind = bkCancel
    ParentDoubleBuffered = False
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 288
    Top = 90
    Width = 25
    Height = 21
    TabOrder = 3
    Text = '9'
    OnChange = Edit2Change
  end
  object UpDown2: TUpDown
    Left = 313
    Top = 90
    Width = 16
    Height = 21
    Associate = Edit2
    Min = 1
    Max = 10
    Position = 9
    TabOrder = 4
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Euc files (*.euc)|*.euc'
    Options = [ofReadOnly, ofHideReadOnly, ofEnableSizing]
    Left = 368
    Top = 80
  end
end
