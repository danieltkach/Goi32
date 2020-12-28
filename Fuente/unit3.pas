unit Unit3;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Buttons, ShellApi, jpeg;

type
  TAboutForm = class(TForm)
    Image2: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutForm: TAboutForm;

implementation

uses uCredits;

{$R *.DFM}

procedure TAboutForm.FormShow(Sender: TObject);
const
  InfoNum = 10;
  InfoStr: array[1..InfoNum] of string = ('CompanyName', 'FileDescription',
  'FileVersion', 'InternalName', 'LegalCopyright', 'LegalTradeMarks',
  'OriginalFileName', 'ProductName', 'ProductVersion', 'Comments');
var
  S: string;
  n, Len: DWORD;
  Buf: PChar;
  Value: PChar;
begin
  S := Application.ExeName;
  n := GetFileVersionInfoSize(PChar(S), n);
  if n > 0 then
  begin
    Buf := AllocMem(n);
    GetFileVersionInfo(PChar(S), 0, n, Buf);
    if VerQueryValue(Buf, PChar('StringFileInfo\040904E4\' + InfoStr[3]),
    Pointer(Value), Len) then Copyright.Caption:=Value;
    FreeMem(Buf, n);
  end;
end;
procedure TAboutForm.Image2Click(Sender: TObject);
begin
  close;
end;

procedure TAboutForm.Label1Click(Sender: TObject);
begin
ShellExecute(0, nil, 'mailto: danieltkach@.com',
    nil, nil, SW_SHOWNORMAL);
end;

procedure TAboutForm.Label5Click(Sender: TObject);
begin
  //fmCredits.ShowModal;
end;

end.
