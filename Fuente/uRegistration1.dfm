object fmRegistration: TfmRegistration
  Left = 210
  Top = 188
  BorderStyle = bsDialog
  Caption = 'Registration'
  ClientHeight = 297
  ClientWidth = 400
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 120
    Width = 377
    Height = 106
  end
  object Label1: TLabel
    Left = 127
    Top = 74
    Width = 147
    Height = 16
    Cursor = crHandPoint
    Caption = 'hokanokoto@gmail.com'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = Label1Click
  end
  object Label2: TLabel
    Left = 36
    Top = 188
    Width = 123
    Height = 13
    Cursor = crHandPoint
    Caption = 'Enter your password here:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 19
    Top = 11
    Width = 354
    Height = 52
    Caption = 
      'Registration only involves sending me an email telling me what y' +
      'ou think about Goi. Then I will mail you back with a password so' +
      ' that you don'#39't see this window any more. If you register I will' +
      ' email you when updates become available.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label4: TLabel
    Left = 36
    Top = 148
    Width = 118
    Height = 13
    Cursor = crHandPoint
    Caption = 'Enter your email address:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object MaskEdit1: TMaskEdit
    Left = 178
    Top = 183
    Width = 185
    Height = 21
    PasswordChar = '#'
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 94
    Top = 256
    Width = 84
    Height = 25
    Caption = 'Register'
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 231
    Top = 256
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object MaskEdit2: TMaskEdit
    Left = 178
    Top = 143
    Width = 185
    Height = 21
    TabOrder = 3
  end
end
