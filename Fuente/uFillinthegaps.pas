unit uFillinthegaps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CategoryButtons, ComCtrls, ExtCtrls, CheckLst, Buttons,
  ImgList, Menus, ExtDlgs;

type
  TfmFillinthegaps = class(TForm)
    edTextwithblanks: TRichEdit;
    OpenDialog1: TOpenDialog;
    puCheckOptions1: TPopupMenu;
    N1Anymistakes1: TMenuItem;
    N1: TMenuItem;
    ImageList1: TImageList;
    N2Showcorrectionsandexit1: TMenuItem;
    panelMistakes1: TPanel;
    lbMistakes: TListBox;
    Label1: TLabel;
    tempTextwithblanks: TRichEdit;
    Panel1: TPanel;
    toolbar1: TPanel;
    btLoad1: TSpeedButton;
    btCheck1: TSpeedButton;
    lstWordstocheck: TCheckListBox;
    edWord: TEdit;
    btEnterword: TBitBtn;
    SpeedButton1: TSpeedButton;
    lstWordsList: TCheckListBox;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    N2Checkcorrectanswers1: TMenuItem;
    PopupMenu1: TPopupMenu;
    Savetext1: TMenuItem;
    Font1: TMenuItem;
    SaveTextFileDialog1: TSaveTextFileDialog;
    SaveDialog1: TSaveDialog;
    procedure btLoad1Click(Sender: TObject);
    procedure edWordChange(Sender: TObject);
    procedure btEnterwordClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lstWordstocheckClick(Sender: TObject);
    procedure btCheck1Click(Sender: TObject);
    procedure N1Anymistakes1Click(Sender: TObject);
    procedure panelMistakes1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Savetext1Click(Sender: TObject);
  private
    procedure CreateStaticText(var Textline: string; var Textposition: TPoint);
    procedure CreateBlankSpace(var Cursorposition: TPoint);
    procedure Fillintheblank(BlankNumber: integer; VocWord: string);
    procedure FormatText(ToFind: string; Count: integer; Color: TColor; Limit1, Limit2: integer);
    procedure ParsingForSentences(Sentences: array of string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmFillinthegaps: TfmFillinthegaps;
  Textspace: integer = 35;
  KeywordIndicator: string ='+';
  SentenceIndicator: string ='*';
  GapLine: string ='__________';
  Wordsfromtext, Inputwords: array of string;

implementation

uses UNIT1, uText;

{$R *.dfm}

procedure TfmFillinthegaps.CreateStaticText(var Textline: string; var Textposition: TPoint);
var
  Statictext: TLabel;
begin
  Statictext:=TLabel.Create(fmFillinthegaps);
  with Statictext do begin
    Parent:=fmFillinthegaps;
    Left:=Textposition.X;
    Top:=Textposition.Y;
    Caption:=Textline;
  end;

  Textposition.X:=Textposition.X+length(Textline)*5;
  if Textposition.X>=350 then begin Textposition.X:=10; Textposition.Y:=Textposition.Y+Textspace; end;
  Textline:='';
end;

procedure TfmFillinthegaps.edWordChange(Sender: TObject);
begin
  btEnterWord.enabled:=edWord.Text<>'';
end;

procedure TfmFillinthegaps.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  edTextwithblanks.Clear;
  tempTextwithblanks.Clear;
  lstWordstocheck.Clear;
  lstWordslist.Clear;
  Form1.WindowState:=wsNormal;
end;

procedure TfmFillinthegaps.lstWordstocheckClick(Sender: TObject);
begin
  edWord.SetFocus;
end;

procedure TfmFillinthegaps.N1Anymistakes1Click(Sender: TObject);
var
  i, iMistakes1: integer;
  lstMistakes1: array of integer;
begin
  SetLength(lstMistakes1, lstWordstocheck.Count);
  iMistakes1:=0;

  for i:=0 to lstWordstocheck.Count-1 do begin
    if Wordsfromtext[i]<>Inputwords[i] then begin
      lstMistakes1[iMistakes1]:=i;
      inc(iMistakes1);
    end;
  end;

  if iMistakes1<>0 then
    if Dialogs.MessageDlg('There are some mistakes. Show where those mistakes are?',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
      panelMistakes1.visible:=true;
      //Showmessage(inttostr(i)+'Ok!') else Showmessage(inttostr(i)+'Wrong...')
end;

procedure TfmFillinthegaps.panelMistakes1Click(Sender: TObject);
begin
  panelMistakes1.Visible:=false;
end;

procedure TfmFillinthegaps.btCheck1Click(Sender: TObject);
var
  i, nWrongs: integer;
begin
  lbMistakes.Clear;
  nWrongs:=0;

  for i:=0 to lstWordstocheck.Count-1 do begin
    if Wordsfromtext[i]<>Inputwords[i] then begin
        lbMistakes.Items.Add(lstWordstocheck.Items[i]);
        lstWordstocheck.Checked[i]:=false;
        inc(nWrongs);
    end
    else lstWordstocheck.Checked[i]:=true;
  end;//for i:=0...

  if nWrongs<>0 then panelMistakes1.Visible:=true else Showmessage('All answers ok!');
end;


procedure TfmFillinthegaps.btEnterwordClick(Sender: TObject);
begin
  lstWordstocheck.Items[lstWordstocheck.ItemIndex]:=inttostr(lstWordstocheck.ItemIndex+1)+' '+edWord.Text;
  Fillintheblank(lstWordstocheck.ItemIndex+1, edWord.Text);
  Inputwords[lstWordstocheck.ItemIndex]:=edWord.Text;
  edWord.Clear;
  if lstWordstocheck.ItemIndex <> lstWordstocheck.Count-1 then
    lstWordstocheck.Selected[lstWordstocheck.ItemIndex+1]:=true;
end;

procedure TfmFillinthegaps.Fillintheblank(BlankNumber: Integer; VocWord: string);
var
  StartPos, FoundAt1, ToEnd, Startposoffset: integer;
  Textbeforenumber: string;
begin
  StartPos:=0;
  ToEnd:=length(edTextwithblanks.Text)-StartPos;
  repeat
    FoundAt1:=edTextwithblanks.FindText(inttostr(BlankNumber), StartPos, ToEnd, [stMatchCase]);
    edTextwithblanks.SelStart:=FoundAt1-1;
    edTextwithblanks.SelLength:=1;
    Textbeforenumber:=edTextwithblanks.SelText;
    StartPos:=edTextwithblanks.SelStart+2;
  until (Textbeforenumber='[');

  if lstWordstocheck.ItemIndex>=9 then Startposoffset:=3 else Startposoffset:=2;

  StartPos:=FoundAt1+Startposoffset;
  edTextwithblanks.SelStart:=StartPos;
  edTextwithblanks.SelLength:=length(Inputwords[lstWordstocheck.ItemIndex]);
  edTextwithblanks.SelText:=edWord.Text;
end;

procedure TfmFillinthegaps.ParsingForSentences(Sentences: array of string);
var
  StartPos, FoundAt1, FoundAt2, ToEnd, Wordcount, SentenceCount: integer;
begin

end;

procedure TfmFillinthegaps.Savetext1Click(Sender: TObject);
begin
SaveTextFileDialog1.FileName:=ChangeFileExt(OpenDialog1.FileName, 'rtf');
if SaveTextFileDialog1.Execute then
  edTextwithblanks.Lines.SaveToFile(SaveTextFileDialog1.FileName);
end;

procedure TfmFillinthegaps.SpeedButton1Click(Sender: TObject);
begin
  lstWordslist.Visible:=not(lstWordslist.Visible);
  if lstWordslist.Visible then begin
    edTextwithblanks.Top:=100;
    edTextwithblanks.Height:=460;
  end else begin
    edTextwithblanks.Top:=0;
    edTextwithblanks.Height:=460+99;
  end;

end;

procedure TfmFillinthegaps.btLoad1Click(Sender: TObject);
var
  StartPos, FoundAt1, FoundAt2, ToEnd, Wordcount, SentenceCount: integer;
  Sentences: array of string;
  lstSentenceIndex: array of integer;
  tempString: string;
  i: integer;
begin
  SetLength(Sentences, 200);
  SetLength(lstSentenceIndex, 200);

  if Opendialog1.Execute then begin
  edTextwithblanks.Clear;
  tempTextwithblanks.Clear;
  lstWordstocheck.Clear;
  lstWordslist.Clear;

  tempTextwithblanks.Lines.LoadFromFile(Opendialog1.FileName);
//*** Parsing for sentences: ***\\
  SentenceCount:=0;
  StartPos:=0;
  ToEnd:=Length(tempTextwithblanks.Text)-StartPos;
  FoundAt1:=tempTextwithblanks.FindText(SentenceIndicator, StartPos, ToEnd, [stMatchCase]);

  while (FoundAt1<>-1) do begin
    ToEnd:=Length(tempTextwithblanks.Text)-StartPos;
    FoundAt1:=tempTextwithblanks.FindText(SentenceIndicator, StartPos, ToEnd, [stMatchCase]);
    if FoundAt1=-1 then break;
    StartPos:=FoundAt1+1;
    tempTextwithblanks.SelStart:=FoundAt1+1;  //
    FoundAt2:=tempTextwithblanks.FindText(SentenceIndicator, StartPos, ToEnd, [stMatchCase]);
    tempTextwithblanks.SelLength:=FoundAt2-FoundAt1-1; //+1

    tempString:=tempTextwithblanks.SelText;
    Sentences[SentenceCount]:=tempString;
    inc(SentenceCount);

    StartPos:=FoundAt2+1;
  end;

  SetLength(Sentences, SentenceCount);
  SetLength(lstSentenceIndex, SentenceCount);
  if Speedbutton2.Down then Form1.MezclarLista(lstSentenceIndex) else
    for i:=0 to SentenceCount-1 do lstSentenceIndex[i]:=i;

  for i:=0 to SentenceCount-1 do begin
    edTextwithblanks.Lines.Add(Sentences[lstSentenceIndex[i]]);
    edTextwithblanks.Lines.Add('');
  end;

  lstWordsList.Clear;
  lstWordstocheck.Clear;
  WordCount:=0;
  StartPos:=0;
  ToEnd:=Length(edTextwithblanks.Text)-StartPos;
  FoundAt1:=edTextwithblanks.FindText(KeywordIndicator, StartPos, ToEnd, [stMatchCase]);
//*** Parsing for workds: ***\\
  //edTextwithblanks.Lines.LoadFromFile(Opendialog1.filename);
  while (FoundAt1<>-1) do begin
    ToEnd:=Length(edTextwithblanks.Text)-StartPos;
    FoundAt1:=edTextwithblanks.FindText(KeywordIndicator, StartPos, ToEnd, [stMatchCase]);
    if FoundAt1=-1 then break;
    StartPos:=FoundAt1+1;
    edTextwithblanks.SelStart:=FoundAt1;
    FoundAt2:=edTextwithblanks.FindText(KeywordIndicator, StartPos, ToEnd, [stMatchCase]);
    edTextwithblanks.SelLength:=FoundAt2-FoundAt1+1;

    lstWordsList.Items.Add(Copy(edTextwithblanks.SelText,2,length(edTextwithblanks.SelText)-2));

    Setlength(Wordsfromtext, Wordcount+1);
    Wordsfromtext[Wordcount]:=Copy(edTextwithblanks.SelText,2,length(edTextwithblanks.SelText)-2);
    Setlength(Inputwords, Wordcount+1);
    Inputwords[Wordcount]:=Gapline;
    inc(Wordcount);

    //Formatear texto, darle color
    edTextwithblanks.SelAttributes.Color:=clBlue;
    edTextwithblanks.SelAttributes.Style:=[fsBold];

    lstWordstocheck.Items.Add(inttostr(Wordcount)+' '+GapLine);
    edTextwithblanks.SelText:='['+inttostr(Wordcount)+']'+GapLine;
    StartPos:=FoundAt2+1;
  end;

  lstWordstocheck.Selected[0]:=true;
  edWord.SetFocus;
  //end;
  end; //if Opendialog1.Execute then begin
end;

procedure TfmFillinthegaps.Button1Click(Sender: TObject);
begin
  tempTextwithblanks.Text:=edTextwithblanks.Text;
end;

procedure TfmFillinthegaps.CreateBlankSpace(var Cursorposition: TPoint);
var
  Blankspace: TEdit;
begin
  Blankspace:=TEdit.Create(fmFillinthegaps);
  with Blankspace do begin
    Parent:=fmFillinthegaps;
    Width:=50;
    Height:=18;
    Left:=Cursorposition.X;
    Top:=Cursorposition.Y-3;
    Text:='';
  end;
  Cursorposition.X:=Cursorposition.X+51;
end;

procedure TfmFillinthegaps.FormatText(ToFind: string; Count: integer; Color: TColor; Limit1, Limit2: integer);
var
  Pos, Pos1, Pos2: integer;
begin
  if Limit2=-1 then Limit2:=Length(fmText.RichEdit1.Text);
  Pos:=fmText.RichEdit1.FindText(ToFind, Limit1, Limit2, [stMatchCase]);
  Pos1:=Pos;
  while Pos<>-1 do begin
    edTextwithblanks.SelStart:=Pos;
    edTextwithblanks.SelLength:=Count;
    fmText.RichEdit1.SelAttributes.Color:=Color;
    edTextwithblanks.SelAttributes.Style:=[fsBold];

    Pos:=edTextwithblanks.FindText(ToFind, Pos+Count, Limit2, [stMatchCase]);
    Pos2:=Pos;
    //Limit2:=Pos1-(Pos+Count);
  end;
end;

end.
