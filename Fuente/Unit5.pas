unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Unit1, IniFiles, ComCtrls;

type
  TConfigForm = class(TForm)
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    Panel1: TPanel;
    edAppPath: TLabeledEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    edVocPath: TLabeledEdit;
    edEssKPath: TLabeledEdit;
    SpeedButton4: TSpeedButton;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    chkDontcopylistfiles: TCheckBox;
    chkDelListFiles1: TCheckBox;
    Edit2: TEdit;
    UpDown2: TUpDown;
    Label3: TLabel;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConfigForm: TConfigForm;

implementation

uses uDirectories;

{$R *.dfm}

procedure TConfigForm.BitBtn1Click(Sender: TObject);
var
  Ini: TIniFile;
begin
  AppPath:=edAppPath.Text;
  VocabularyPath:=edVocPath.Text;
  EssentialKanjiPath:=edEssKPath.Text;

  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try
    Ini.WriteString('Options', 'Application path', edAppPath.Text);
    Ini.WriteString('Options', 'Vocabulary path', edVocPath.Text);
    Ini.WriteString('Options', 'Essential Kanji path', edEssKPath.Text);
    Ini.Writeinteger('Options', 'Retest every', ConstRetestEvery);
    Ini.WriteInteger('Options', 'Max to retest', ToRetestLimit);
    Ini.WriteBool('Options', 'Delete list files when .goi is created', chkDelListFiles1.Checked);
  finally
    Ini.Free;
  end;
end;

procedure TConfigForm.FormShow(Sender: TObject);
var
  Ini: TIniFile;
begin
  edAppPath.Text:=AppPath;
  edVocPath.Text:=VocabularyPath;
  edEssKPath.Text:=EssentialKanjiPath;

  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try
    edAppPath.Text:=Ini.ReadString('Options', 'Application path', 'c:\Goi32\');
    edVocPath.Text:=Ini.ReadString('Options', 'Vocabulary path', 'c:\Goi32\Vocabulary\');
    edEssKPath.Text:=Ini.ReadString('Options', 'Essential Kanji path', 'c:\Goi32\Essential Kanji\');
    ConstRetestEvery:=Ini.ReadInteger('Options', 'Retest every', 4);
    ToRetestLimit:=Ini.ReadInteger('Options', 'Max to retest', 9);

    chkDelListFiles1.Checked:=Ini.ReadBool('Options', 'Delete list files when .goi is created', True);
  finally
    Ini.Free;
  end;

  UpDown1.Position:=Constretestevery;
  Updown2.Position:=ToRetestLimit;
end;

procedure TConfigForm.SpeedButton2Click(Sender: TObject);
begin
  if fmDirectories.Showmodal =mrOk then
    edAppPath.Text:=fmDirectories.DirectoryListBox1.Directory+'\';
end;

procedure TConfigForm.SpeedButton3Click(Sender: TObject);
begin
    if fmDirectories.Showmodal =mrOk then
    edVocPath.Text:=fmDirectories.DirectoryListBox1.Directory+'\';
end;

procedure TConfigForm.SpeedButton4Click(Sender: TObject);
begin
  if fmDirectories.Showmodal =mrOk then
    edEssKPath.Text:=fmDirectories.DirectoryListBox1.Directory+'\';
end;

procedure TConfigForm.Edit1Change(Sender: TObject);
begin
  ConstRetestEvery:=Updown1.Position;
end;

procedure TConfigForm.Edit2Change(Sender: TObject);
begin
  ToRetestLimit:=Updown2.Position;
end;

end.
