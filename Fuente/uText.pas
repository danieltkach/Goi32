unit uText;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, Buttons, ExtCtrls;

type
  TfmText = class(TForm)
    RichEdit1: TRichEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    btClear: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ShowWindow(FileName: string);
    { Public declarations }
  end;

var
  fmText: TfmText;
  fName: string;

implementation

uses
  Unit1;

{$R *.dfm}

procedure TfmText.ShowWindow(FileName: string);
begin
  fmText.Show;
  fName:=Filename;
end;

procedure TfmText.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TfmText.FormShow(Sender: TObject);
begin
  RichEdit1.SetFocus;
end;

procedure TfmText.btClearClick(Sender: TObject);
var
  i: integer;
  Line: string;
  textLength: integer;
begin
  if MessageDlg('Do you want to clean the file?', mtWarning, mbOkCancel, 0) = mrOk then begin
  if fName=AppPath+LogFile1 then begin deletefile(AppPath+LogFile1); close; end else begin
  i:=0;
  textLength:=0;
  //Line:=Memo1.Lines[0];
  Line:=Richedit1.Lines[0];
  while Copy(Line, 1, 3) <> '___' do begin
    textLength:=textLength+Length(Line);
    //Line:=Memo1.Lines[i];
    Line:=Richedit1.Lines[i];
    inc(i);
  end;

  Richedit1.SelStart:=textLength+39;
  Richedit1.SelLength:=Length(Richedit1.Text)-textLength;
  Richedit1.ClearSelection;
  Richedit1.Lines.Add(#13);
  Richedit1.Lines.SaveToFile(fName, TEncoding.Unicode);
  //Richedit1.Lines.LoadFromFile(fName, TEncoding.Unicode);
  end;
  end;
end;

end.
