unit uMultipleChoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Buttons, StdCtrls, Menus;

type
  TfmMultipleChoice = class(TForm)
    QuestionPanel: TPanel;
    StatusBar1: TStatusBar;
    ScrollBox1: TScrollBox;
    Timer1: TTimer;
    sbHide: TSpeedButton;
    sbShowanswer: TSpeedButton;
    Bevel1: TBevel;
    lbHelp: TLabel;
    sbWaitforright: TSpeedButton;
    PopupMenu1: TPopupMenu;
    FontDialog1: TFontDialog;
    Font1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure KanjipanelOnClick(Sender: TObject);
    procedure KanjipanelOnMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Font1Click(Sender: TObject);
  private
    function ShowRightAnswer(Show: boolean): unicodestring;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMultipleChoice: TfmMultipleChoice;
  Globalsender: TObject;
  waInc: boolean;

implementation

uses Unit1, uTesting1, Unit4;

{$R *.dfm}

procedure TfmMultipleChoice.KanjipanelOnMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if (Sender as TPanel).ShowHint then
    Statusbar1.Panels[3].Text:=(Sender as TPanel).Hint;
end;

procedure TfmMultipleChoice.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  NumPanels, i: integer;
begin
  NumPanels:=Scrollbox1.ComponentCount-1;
    for i:=0 to NumPanels do begin
      Scrollbox1.Components[0].Free;
    end;
  if indice<>limite then
  begin
    form1.WindowState:=wsnormal;
    Form1.LogToFile(Form1.Logginglist1, 'Test interrupted...', '1111');
  end;
end;

procedure TfmMultipleChoice.FormShow(Sender: TObject);
var
  Kanjipanel: TPanel;
  Panelpos: TPoint;
  i: integer;
begin
  Indice:=0;
  raCounter:=0;
  waCounter:=0;
  waInc:=True;
  Statusbar1.Panels[0].Text:='Right: '+inttostr(raCounter);
  Statusbar1.Panels[1].Text:='Wrong: '+inttostr(waCounter);
  Statusbar1.Panels[2].Text:='Left: '+inttostr(Limite-Indice)+' ';
  Statusbar1.Panels[3].Text:='';

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

  TestingForm.Checkwhatlisttoshow(QuestionPanel, lbHelp);
  Panelpos.X:=8;
  Panelpos.Y:=8;
  for i:=0 to Limite do begin
    Kanjipanel:=TPanel.Create(Scrollbox1);
    Kanjipanel.Font.Charset:=SHIFTJIS_CHARSET;
    Kanjipanel.Parent:=Scrollbox1;
    Kanjipanel.Color:=clOlive;
    Kanjipanel.Bevelouter:=bvNone;
    Kanjipanel.Borderstyle:=bsSingle;
    Kanjipanel.Cursor:=crHandpoint;
    Kanjipanel.Font.Size:=34;
    Kanjipanel.Font.Name:='MS Mincho';
    Kanjipanel.Width:=65;
    Kanjipanel.Height:=65;
    Kanjipanel.Top:=Panelpos.Y;
    Kanjipanel.Left:=Panelpos.X;
    Panelpos.X:=Panelpos.X+72;
    Kanjipanel.Tag:=i;
    Kanjipanel.Caption:=lista11[i];
    Kanjipanel.Hint:=lista44[i]+' - '+lista22[i];
    //Kanjipanel.ShowHint:=True;
    Kanjipanel.OnClick:=KanjipanelOnClick;
    Kanjipanel.OnMouseMove:=KanjipanelOnMouseMove;
    Kanjipanel.PopupMenu:=Popupmenu1;
    if Panelpos.X>520 then begin
      Panelpos.Y:=Panelpos.Y+72;
      Panelpos.X:=8;
      end;
  end;
end;

procedure TfmMultipleChoice.KanjipanelOnClick(Sender: TObject);
begin
  Scrollbox1.Enabled:=False;
  Form1.LogToFile(Form1.Logginglist1, '    '+QuestionPanel.Caption+' <-> '+(Sender as TPanel).Caption, '0000');
  {caption:='Click on panel: '+inttostr((Sender as TPanel).Tag)+' - '+lista11[(Sender as TPanel).Tag]+
    ' - '+lista44[(Sender as TPanel).Tag];}
  if
  (lista44[(Sender as TPanel).Tag]=Questionpanel.Caption)
  or
  (lista22[(Sender as TPanel).Tag]=Questionpanel.Caption)
  then begin
    (Sender as TPanel).Color:=clLime;
    Form1.LogToFile(Form1.Logginglist1, '  Correct!', '0100');
    if waInc then begin
      righta[raCounter]:=(QuestionPanel.caption);
      rightaindex[raCounter]:=l1[indice];
      inc(raCounter);
    end;
    waInc:=True;
    //(Sender as TPanel).Hint:=Questionpanel.Caption;
    (Sender as TPanel).ShowHint:=True;
    Timer1.Tag:=1;
  end else begin
    (Sender as TPanel).Color:=clRed;
    wronga[waCounter]:=(QuestionPanel.caption);
    wrongaindex[waCounter]:=l1[indice];
    Form1.LogToFile(Form1.Logginglist1, '  Wrong! >-> '+Showrightanswer(false), '0100');
    if waInc
    //or (((Globalsender as TPanel).Tag)<>((Sender as TPanel).Tag))
    then inc(waCounter); //or Clicked a different kanji...
    waInc:=False;
    if sbShowanswer.Down then Showrightanswer(true);
    Timer1.Tag:=0;
  end;
  Globalsender:=Sender;
  Timer1.Enabled:=True;
end;

procedure TfmMultipleChoice.Timer1Timer(Sender: TObject);
var
  i, NumPanels: integer;
begin
  Timer1.Enabled:=False;
  Statusbar1.Panels[0].Text:='Right: '+inttostr(raCounter);
  Statusbar1.Panels[1].Text:='Wrong: '+inttostr(waCounter);
  Statusbar1.Panels[2].Text:='Left: '+inttostr(Limite-Indice)+' ';
  if (Timer1.Tag=1)and(sbHide.Down) then (Globalsender as TPanel).Free;
  if (Timer1.Tag<>1) then (Globalsender as TPanel).Color:=clOlive;
  if indice=limite then begin

    TestingForm.CleanRigthWrongLists;
    NumPanels:=Scrollbox1.ComponentCount-1;
    for i:=0 to NumPanels do begin
      Scrollbox1.Components[0].Free;
    end;
    fmResults.Show;
    close;
  end else begin
    if (sbWaitforright.Down=false) or (Timer1.Tag=1) then begin inc(indice); waInc:=True; end;
    TestingForm.Checkwhatlisttoshow(QuestionPanel, lbHelp);
  end;
  Scrollbox1.Enabled:=True;
end;

function TfmMultipleChoice.ShowRightAnswer(Show: boolean): unicodestring;
var
  i: integer;
  RightAnswers: unicodestring;
begin
  Rightanswers:='';
  for i:=0 to Scrollbox1.ComponentCount-1 do begin
    if
    (lista44[(Scrollbox1.Components[i] as TPanel).Tag]=QuestionPanel.Caption)
    or
    (lista22[(Scrollbox1.Components[i] as TPanel).Tag]=QuestionPanel.Caption)
    then begin
      if Show then (Scrollbox1.Components[i] as TPanel).Color:=clYellow;
      RightAnswers:=RightAnswers+(Scrollbox1.Components[i] as TPanel).Caption+' ';
    end;
  end;
  ShowRightAnswer:=RightAnswers;
end;

procedure TfmMultipleChoice.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=VK_UP) then Scrollbox1.VertScrollBar.Position:=Scrollbox1.VertScrollBar.Position-72;
  if (Key=VK_DOWN) then Scrollbox1.VertScrollBar.Position:=Scrollbox1.VertScrollBar.Position+72;
end;

procedure TfmMultipleChoice.Font1Click(Sender: TObject);
var
  i: integer;
begin
  if Fontdialog1.Execute then begin
    for i:=0 to (Scrollbox1.ComponentCount-1) do
      if Scrollbox1.Components[i] is TPanel then
        (Scrollbox1.Components[i] as TPanel).Font:=Fontdialog1.Font;
  end;
end;

end.
