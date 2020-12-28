unit uToKanji;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TfmToKanji = class(TForm)
    KanjiPanel: TPanel;
    btShowkanji: TBitBtn;
    btWasright: TBitBtn;
    StatusBar1: TStatusBar;
    btWaswrong: TBitBtn;
    Bevel1: TBevel;
    ReadingPanel: TPanel;
    Timer1: TTimer;
    lbHelp: TLabel;
    cbHelp: TCheckBox;
    procedure btShowkanjiClick(Sender: TObject);
    procedure btWasrightClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btWaswrongClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmToKanji: TfmToKanji;

implementation

uses Unit1, uTesting1, Unit4;

{$R *.dfm}

procedure TfmToKanji.btShowkanjiClick(Sender: TObject);
begin
  btShowkanji.Enabled:=False;
  btWasright.Enabled:=True;
  btWaswrong.Enabled:=True;
  KanjiPanel.Caption:=lista11[l1[indice]];
  fmTokanji.SetFocus;
  Form1.LogToFile(Form1.Logginglist1, '    '+ReadingPanel.Caption, '0000');
end;

procedure TfmToKanji.btWasrightClick(Sender: TObject);
begin
  btWasright.Enabled:=False;
  btWaswrong.Enabled:=False;
  righta[raCounter]:=KanjiPanel.caption;
  rightaindex[raCounter]:=l1[indice];
  inc(raCounter);
  Statusbar1.Panels[0].Text:='Right: '+inttostr(raCounter);
  Form1.LogToFile(Form1.Logginglist1, '  Correct!', '0100');
  Kanjipanel.Color:=clGreen;
  Timer1.Enabled:=True;
end;

procedure TfmToKanji.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if indice<>limite then
  begin
    form1.WindowState:=wsnormal;
    Form1.LogToFile(Form1.Logginglist1, ' ', '0100');
    Form1.LogToFile(Form1.Logginglist1, 'Test interrupted...', '1111');
  end;
end;

procedure TfmToKanji.btWaswrongClick(Sender: TObject);
begin
  btWasright.Enabled:=False;
  btWaswrong.Enabled:=False;
  wronga[waCounter]:=KanjiPanel.caption;
  wrongaindex[waCounter]:=l1[indice];
  inc(waCounter);
  Form1.LogToFile(Form1.Logginglist1, '  Wrong! >-> '+Kanjipanel.Caption, '0100');
  Statusbar1.Panels[1].Text:='Wrong: '+inttostr(waCounter);
  Kanjipanel.Color:=clRed;
  Timer1.Enabled:=True;
end;

procedure TfmToKanji.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:=False;
  if (indice=limite) then
  begin
    TestingForm.CleanRigthWrongLists;     
    fmResults.show;
    close;
    exit;
  end;
  indice:=indice+1;
  TestingForm.Checkwhatlisttoshow(fmToKanji.ReadingPanel, fmToKanji.lbHelp);
  lbHelp.Visible:=cbHelp.Checked; //then Statusbar1.Panels[2].Text:=lbHelp.Caption else Statusbar1.Panels[2].Text:='';
  Kanjipanel.Caption:='';
  Kanjipanel.Color:=clGray;
  btShowkanji.Enabled:=True;
  Statusbar1.Panels[2].Text:='Left: '+inttostr(Limite-Indice)+' ';
end;

procedure TfmToKanji.FormShow(Sender: TObject);
var
  i: integer;
begin
  btShowkanji.Enabled:=True;
  btWasright.Enabled:=False;
  btWaswrong.Enabled:=False;
  Kanjipanel.Caption:='';
  SetLength(righta, Limite+1);
  SetLength(wronga, Limite+1);
  SetLength(ToRetest.Right, Limite+1);

  SetLength(wrongaindex, Limite+1);
  SetLength(rightaindex, Limite+1);
  for i:=0 to Length(wronga)-1 do begin
    wronga[i]:='';
    righta[i]:='';
    wrongaindex[i]:=-1;
    rightaindex[i]:=-1;
  end;

  //if not(cbShowHelp.checked) then lbHelp.visible:=false;
  //I don't understand why this line here...->//fmResults.close;
  KanjiPanel.color:=clGray;
  KanjiPanel.Font.Size:=75;
  indice:=0;
  waCounter:=0;
  raCounter:=0;
  //lbRightAnsNum.caption:='0';
  //lbWrongAnsNum.caption:='0';
  Statusbar1.Panels[0].Text:='Right: 0';
  Statusbar1.Panels[1].Text:='Wrong: 0';
  Statusbar1.Panels[2].Text:='Left: '+inttostr(Limite-Indice)+' ';
  TestingForm.Checkwhatlisttoshow(fmToKanji.ReadingPanel, fmToKanji.lbHelp);
  lbHelp.Visible:=cbHelp.Checked;//then Statusbar1.Panels[2].Text:=lbHelp.Caption else Statusbar1.Panels[2].Text:='';
end;

procedure TfmToKanji.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=VK_DELETE)and(btWaswrong.Enabled) then btWasWrong.OnClick(Sender);
end;

procedure TfmToKanji.cbHelpClick(Sender: TObject);
begin
  lbHelp.Visible:=cbHelp.Checked; //then Statusbar1.Panels[2].Text:=lbHelp.Caption else Statusbar1.Panels[2].Text:='';
  fmTokanji.SetFocus;
end;

end.
