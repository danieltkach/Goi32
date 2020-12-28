unit uTesting1;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Unit1, Menus, jpeg, Mask,
  ComCtrls;

type
  TTestingForm = class(TForm)
    QuestionPanel: TPanel;
    edAnswer: TEdit;
    Bevel1: TBevel;
    btCheckAnswer: TBitBtn;
    LabelCorrect: TLabel;
    LabelWrong: TLabel;
    lbRightAnsNum: TLabel;
    lbWrongAnsNum: TLabel;
    lbRightAnswer: TLabel;
    Timer1: TTimer;
    lbHelp: TLabel;
    cbShowHelp: TCheckBox;
    sbHiragana: TSpeedButton;
    sbKatakana: TSpeedButton;
    DevanaagariiFontDialog1: TFontDialog;
    PopupMenu1: TPopupMenu;
    Changefont1: TMenuItem;
    Image1: TImage;
    N1: TMenuItem;
    sbAutosaveWronganswers: TSpeedButton;
    sbRetestMistakes: TSpeedButton;
    sbSavemistakes: TSpeedButton;
    sbRetestNine: TSpeedButton;
    SpeedButton1: TSpeedButton;
    WordclassPanel: TPanel;
    sbTense: TSpeedButton;
    sbType: TSpeedButton;
    sbPerson: TSpeedButton;
    sbNumber: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btCheckAnswerClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cbShowHelpClick(Sender: TObject);
    procedure kanabuttons(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Changefont1Click(Sender: TObject);
    procedure sbAutosaveWronganswersClick(Sender: TObject);
    procedure sbRetestMistakesClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure sbTenseClick(Sender: TObject);
    procedure sbTypeClick(Sender: TObject);
    procedure sbPersonClick(Sender: TObject);
    procedure sbNumberClick(Sender: TObject);
  private
    procedure CheckAnswer(Checkfrom: array of unicodestring);
    { Private declarations }
  public
    { Public declarations }
    procedure CheckWhatListtoShow(WhereQuestion, WhereHelp: TObject);
    procedure ShowWindow(WindowTypeoftest: Unit1.TTypeoftest; WindowCaption, CheckboxCaption: unicodestring);
    procedure CleanRigthWrongLists;
    procedure ActivateRetestMistakes(Activate: boolean);
    procedure MixToRetestList(q: integer); //q --> cantidad de items
  end;

  TWordtotest=record
    Texto: unicodestring;
    indice: integer;
  end;

  TRetestData=record
    Right: array of unicodestring;
    MainlistRef: array of integer; //Lista de indices que referencian a la lista principal de vocabulario.
    Mixedlist: array of integer;
    Count,
    Index,
    Corrected,
    Every: integer;
    Active: boolean;
  end;

  {TRetestData=record
    trWord: array of TWordtotest;
    Count,
    Index,
    Corrected,
    Every: integer;
    Active: boolean;
  end;}

var
  TestingForm: TTestingForm;
  indice, Every: integer;
  wronga: array of unicodestring;
  wrongaindex, rightaindex: array of integer;
  righta: array of unicodestring;
  waCounter, raCounter: integer;
  ToRetest: TRetestData;
  tempTypeoftest: TTypeoftest;
  tempTimer: integer;

const
  fdtViolet=$00AA44FD;
  fdtGreen=$00BA9E01;
  fdtBlack=$00463892;

  wTense: array [1..3] of string =('vartamAna', 'bhUta', 'preraNA');
  wType: array [1..2] of string =('parasmaipadI', 'AtmanepadI');
  wPerson: array [1..3] of string =('prathama', 'madhyama', 'uttama');
  wNumber: array [1..3] of string =('eka' , 'dvi', 'bahu');


implementation
uses
  unit4;

{$R *.DFM}

procedure TTestingForm.FormShow(Sender: TObject);
var
  i: integer;
begin
  SetLength(righta, Limite+1);
  SetLength(wronga, Limite+1);
  SetLength(ToRetest.Right, Limite+1);
  //SetLength(ToRetest.trWord, Limite+1);
  SetLength(ToRetest.MainlistRef, Limite+1);
  SetLength(ToRetest.Mixedlist, Limite+1);
  for i:=0 to Limite+1 do ToRetest.Mixedlist[i]:=0;

  SetLength(wrongaindex, Limite+1);
  SetLength(rightaindex, Limite+1);
  for i:=0 to Length(wronga)-1 do begin
    wronga[i]:='';
    righta[i]:='';
    wrongaindex[i]:=-1;
    rightaindex[i]:=-1;
  end;

  //ConstRetestEvery:=4;
  ToRetest.Every:=ConstRetestEvery;
  ToRetest.Count:=0;
  ToRetest.Index:=0;
  ToRetest.Corrected:=0;
  sbRetestmistakes.down:=form1.Retestmistakes1.Checked;

  if not(cbShowHelp.checked) then lbHelp.visible:=false;
  sbHiragana.down:=true;
  sbKatakana.down:=true;
  edAnswer.text:='';
  edAnswer.enabled:=true;
  btCheckAnswer.enabled:=true;
  QuestionPanel.color:=clblack;
  QuestionPanel.Font.Size:=16;
  //lbRightAnswer.caption:='- - -';
  lbRightAnswer.Visible:=false;
  activecontrol:=edAnswer;
  indice:=0;
  waCounter:=0;
  raCounter:=0;
  lbRightAnsNum.caption:='0';
  lbWrongAnsNum.caption:='0';
  lbRightAnswer.Font.Size:=12;
  Checkwhatlisttoshow(QuestionPanel, lbHelp);
  //TestingForm.SetFocus;

  sbAutosaveWronganswers.Down:=form1.sbAutosaveWronganswers.Down;
  sbRetestMistakes.Down:=form1.sbRetestMistakes.Down;
  sbRetestNine.Down:=form1.sbRetestNine.Down;
  tempTypeoftest:=Typeoftest;
  {
  if (TypeofTest=ttShow1Askfor3) or (TypeofTest=ttShow2Askfor3) then
  edAnswer.Text:=wTense[sbTense.Tag]+' '+wType[sbType.Tag]+' '
    +wPerson[sbPerson.Tag]+' '+wNumber[sbNumber.Tag];
    }
end;

procedure TTestingForm.Image1Click(Sender: TObject);
begin
  Caption:='count:'+inttostr(Toretest.Count)+
    ' -index:'+inttostr(ToRetest.Index)+
    ' -corrected:'+inttostr(ToRetest.Corrected);
end;

procedure TTestingForm.btCheckAnswerClick(Sender: TObject);
begin
{Caption:='count:'+inttostr(Toretest.Count)+
  ' -index:'+inttostr(ToRetest.Index)+
  ' -corrected:'+inttostr(ToRetest.Corrected);}

  if (Typeoftest<>RetestMistakes) then begin
    Form1.LogToFile(Form1.Logginglist1, '    '+QuestionPanel.Caption+' <-> '+edAnswer.Text, '0000');
  end;

  if (Typeoftest=HiraganaTest) or (Typeoftest=KatakanaTest) or
    (Typeoftest=KanaTest) or (Typeoftest=KanjiToReading) or (Typeoftest=MeaningToRomaji)
      or (Typeoftest=ttShow3Askfor4)
    then CheckAnswer(lista44)
  else if (Typeoftest=ReadingToMeaning) or (Typeoftest=KanjiToMeaning)
    then CheckAnswer(lista22)
  else if (Typeoftest=MeaningToKanji)
    then CheckAnswer(lista22)
  else if (Typeoftest=ReadingToKanji) or (Typeoftest=ttShow1Askfor3)
    or (Typeoftest=ttShow2Askfor3)
    then CheckAnswer(lista33)
  else if (Typeoftest=RetestMistakes)
    then CheckAnswer(ToRetest.Right);
  end;

procedure TTestingForm.Changefont1Click(Sender: TObject);
begin
  if DevanaagariiFontDialog1.Execute then QuestionPanel.Font:=DevanaagariiFontDialog1.Font;
end;

procedure TTestingForm.MixToRetestList(q: Integer);
var
  aa, bb, cc, num, lstlength: integer;
begin
  lstlength:=q-1;
  //Si algo se cuelga, cambiar lstlength por limite en las próximas líneas
  for aa:=0 to lstlength do ToRetest.Mixedlist[aa]:=-1;
  aa:=0;
  while (aa<=lstlength) do begin
    num:=random(lstlength+1);
    cc:=0;
    for bb:=0 to lstlength do if num=ToRetest.Mixedlist[bb] then cc:=1;
    if cc=0 then begin ToRetest.Mixedlist[aa]:=num; aa:=aa+1;end;
  end;

end;

procedure TTestingForm.ActivateRetestMistakes(Activate: boolean);
begin
  if Activate then begin
    tempTypeoftest:=Typeoftest;
    tempTimer:=Timer1.Interval;
    Timer1.Interval:=200;
    Typeoftest:=RetestMistakes;
    ToRetest.Index:=0;
    ToRetest.Corrected:=0;
    if ToRetest.Count>1 then MixToRetestList(ToRetest.Count);
    Every:=0;

  end else begin
    Typeoftest:=tempTypeoftest;
    ToRetest.Corrected:=0;
    ToRetest.Index:=0;
  end;
end;

procedure TTestingForm.CheckAnswer(Checkfrom: array of unicodestring);
begin
  edAnswer.Enabled:=false;
  btCheckAnswer.Enabled:=false;
  //Respuesta correcta en modo normal//
  if (Typeoftest<>RetestMistakes) and (edAnswer.text=Checkfrom[l1[indice]]) then begin
    QuestionPanel.color:=clgreen;
    form1.LogToFile(Form1.Logginglist1, '  Correct!', '0100');
    lbRightAnsNum.caption:=inttostr(strtoint(lbRightAnsNum.caption)+1);
    righta[strtoint(lbRightAnsNum.caption)-1]:=(QuestionPanel.caption);
    rightaindex[strtoint(lbRightAnsNum.caption)-1]:=l1[indice];
    inc(raCounter);
    inc(Every);

    if (ToRetest.Count<>0) and (Every=ToRetest.Every) and (sbRetestmistakes.Down) then
      ActivateRetestMistakes(true);

    if Form1.Dontusetimerwhenright1.Checked then Timer1Timer(TestingForm)
    else if not Form1.Pausewhenright1.Checked then timer1.enabled:=true;

      //Respuesta correcta en modo RetestMistakes//
  end else

  if Typeoftest=RetestMistakes then begin

    if (edAnswer.text=Checkfrom[ToRetest.Mixedlist[ToRetest.Index]]) then begin
      QuestionPanel.color:=fdtGreen;
      inc(ToRetest.Index);
      inc(ToRetest.Corrected);

      if (ToRetest.Count=ToRetest.Corrected)
      or((ToRetest.Corrected=ToRetestLimit) and (sbRetestNine.Down)) then
        ActivateRetestMistakes(false);

      //Si todas no fueron correctas, vuelve a empezar//
      if (ToRetest.Count=ToRetest.Index) and (ToRetest.Count<>ToRetest.Corrected)
      then begin
        ToRetest.Index:=0;
        ToRetest.Corrected:=0;
      end;

      if (ToRetestLimit=ToRetest.Index) and (ToRetestLimit<>ToRetest.Corrected)
        and (sbRetestNine.Down)
      then begin
        ToRetest.Index:=0;
        ToRetest.Corrected:=0;
      end;

      if not Form1.Pausewhenright1.Checked then timer1.enabled:=true;
    end else begin

    //Respuesta incorrecta en RetestMistakes, entonces ve qué muestra como respuesta correcta:
      if Fileopened.CurrentTypeofTest=MeaningtoRomaji then begin
        lbRightAnswer.caption:=lista11[ToRetest.MainlistRef[ToRetest.Mixedlist[ToRetest.Index]]];
        lbRightAnswer.Visible:=true;
      end else begin
        lbRightAnswer.caption:=Checkfrom[ToRetest.Mixedlist[ToRetest.Index]];
        lbRightAnswer.Visible:=true;
      end;

      QuestionPanel.color:=fdtViolet;
      inc(ToRetest.Index);
      //Vuelve a empezar con las respuestas incorrectas.
      //***BACK UP if (ToRetest.Count=ToRetest.Index) then begin  +++  //
      if (ToRetest.Count=ToRetest.Index) and
      ((sbRetestmistakes.Down)or(sbRetestNine.Down)) then begin
        ToRetest.Index:=0;
        //ToRetest.Corrected:=0;
      end else
      if (ToRetestLimit=ToRetest.Index) and (ToRetestLimit<>ToRetest.Corrected)
        and (sbRetestNine.Down) then begin
          ToRetest.Index:=0;
          //ToRetest.Corrected:=0;
      end;
      ToRetest.Corrected:=0;

      if not (sbRetestmistakes.Down) and not(sbRetestNine.Down) then
        ActivateRetestMistakes(false);

      if not Form1.Pausewhenwrong1.Checked then timer1.enabled:=true;
    end;//if (edAnswer.text=Checkfrom[ToRetest.Index]) then begin

  end else begin
     //Respuesta incorrecta en modo normal//
    //Qué se muestra como respuesta correcta:
    if Fileopened.CurrentTypeofTest=MeaningtoRomaji then begin
      lbRightAnswer.caption:=lista11[l1[indice]];
      lbRightAnswer.Visible:=true;
    end else begin
      lbRightAnswer.caption:=Checkfrom[l1[indice]];
      lbRightAnswer.Visible:=true;
    end;

    lbWrongAnsNum.caption:=inttostr(strtoint(lbWrongAnsNum.caption)+1);
    QuestionPanel.color:=clred;

    Form1.LogToFile(Form1.Logginglist1, '  Wrong! >-> '+lbRightAnswer.Caption, '0100');
    if Typeoftest<>RetestMistakes then begin
      wronga[strtoint(lbWrongAnsNum.caption)-1]:=QuestionPanel.caption;

      //Guarda respuesta correcta en ToRetest//
      if sbSaveMistakes.Down then begin
        ToRetest.Right[strtoint(lbWrongAnsNum.caption)-1]:=Checkfrom[l1[indice]];
        ToRetest.MainlistRef[strtoint(lbWrongAnsNum.caption)-1]:=l1[indice];
        inc(ToRetest.Count);
      end;
      wrongaindex[strtoint(lbWrongAnsNum.caption)-1]:=l1[indice];
      inc(waCounter);
      if (sbRetestmistakes.Down or sbRetestNine.Down) then ActivateRetestMistakes(true);
    end;
    if not Form1.Pausewhenwrong1.Checked then timer1.enabled:=true;
  end;
end;


procedure TTestingForm.Timer1Timer(Sender: TObject);
begin
  timer1.enabled:=false;
  if (indice=limite) and (Typeoftest<>RetestMistakes) then
  begin
    CleanRigthWrongLists;
    fmResults.show;
    close;
    exit;
  end;

  {if (TypeofTest<>ttShow1Askfor3) and (TypeofTest<>ttShow2Askfor3) then} edAnswer.text:='';
  edAnswer.enabled:=true;
  btCheckAnswer.enabled:=true;
  if Typeoftest<>RetestMistakes then begin
    indice:=indice+1;
    QuestionPanel.color:=clblack;
    Timer1.Interval:=tempTimer;
  end else
    QuestionPanel.color:=fdtBlack;
    lbRightAnswer.Visible:=false;
    lbRightAnswer.caption:='- - -';
    activecontrol:=edAnswer;
    Checkwhatlisttoshow(QuestionPanel, lbHelp);
end;

procedure TTestingForm.CleanRigthWrongLists;
var
  i: integer;
  tempList: array of integer;
begin
  //
  SetLength(tempList, Length(rightaindex));
  for i:=0 to raCounter-1 do
    tempList[i]:=rightaindex[i];
  SetLength(rightaindex, raCounter);
  for i:=0 to raCounter-1 do
    rightaindex[i]:=tempList[i];
  //
  SetLength(tempList, Length(wrongaindex));
  for i:=0 to waCounter-1 do
    tempList[i]:=wrongaindex[i];
  SetLength(wrongaindex, waCounter);
  for i:=0 to waCounter-1 do
    wrongaindex[i]:=tempList[i];
end;



procedure TTestingForm.CheckWhatListtoShow(WhereQuestion, WhereHelp: TObject);
begin
  if Typeoftest=Kanjitomeaning then begin
    (WhereHelp as TLabel).caption:=lista33[l1[indice]];
    //QuestionPanel.caption:=lista11[l1[indice]];
    (WhereQuestion as TPanel).caption:=lista11[l1[indice]];
  end
  else if Typeoftest=Kanjitoreading then begin
    (WhereHelp as TLabel).caption:=lista22[l1[indice]];
    (WhereQuestion as TPanel).caption:=lista11[l1[indice]];
  end
  else if Typeoftest=Readingtokanji then begin
    (WhereHelp as TLabel).caption:=lista22[l1[indice]];
    (WhereQuestion as TPanel).font.size:=8;
    lbRightAnswer.Font.Size:=12;
    (WhereQuestion as TPanel).caption:=lista44[l1[indice]];
  end
  else if Typeoftest=Meaningtokanji then begin
    (WhereHelp as TLabel).caption:=lista44[l1[indice]];
    (WhereQuestion as TPanel).font.size:=8;
    lbRightAnswer.Font.Size:=12;
    (WhereQuestion as TPanel).caption:=lista22[l1[indice]];
  end
  else if Typeoftest=Hiraganatest then (WhereQuestion as TPanel).caption:=lista11[l1[indice]]
  else if Typeoftest=Katakanatest then (WhereQuestion as TPanel).caption:=lista33[l1[indice]]
  else if Typeoftest=Kanatest then (WhereQuestion as TPanel).caption:=lista11[l1[indice]]+'   '+lista33[l1[indice]]
  else if Typeoftest=Meaningtoromaji then begin
    (WhereQuestion as TPanel).caption:=lista22[l1[indice]];
    (WhereQuestion as TPanel).font.size:=12;
    lbRightAnswer.Font.Size:=14;
  end
  else if Typeoftest=Readingtomeaning then begin
    (WhereQuestion as TPanel).caption:=lista33[l1[indice]];
    (WhereHelp as TLabel).caption:=lista11[l1[indice]];
  end
  else if (Typeoftest=ttShow1Askfor3) then begin
    (WhereQuestion as TPanel).caption:=lista11[l1[indice]];
    (WhereHelp as TLabel).caption:=lista22[l1[indice]];
  end
  else if (Typeoftest=ttShow3Askfor4) then begin
    (WhereQuestion as TPanel).caption:=lista33[l1[indice]];
    (WhereHelp as TLabel).caption:=lista22[l1[indice]];
  end
  else if (Typeoftest=ttShow2Askfor3) then begin
    (WhereQuestion as TPanel).caption:=lista22[l1[indice]];
    (WhereHelp as TLabel).caption:=lista11[l1[indice]];
  end
  {else if (Typeoftest=ttShow3Askfor1 then begin
    (WhereQuestion as TPanel).caption:=lista33[l1[indice]];
    (WhereHelp as TLabel).caption:=lista22[l1[indice]];
  end}
  else if (Typeoftest=RetestMistakes) then begin
    (WhereQuestion as TPanel).caption:=wronga[ToRetest.Mixedlist[ToRetest.Index]];
    (WhereHelp as TLabel).caption:='';
  end;

end;

procedure TTestingForm.cbShowHelpClick(Sender: TObject);
begin
  lbHelp.visible:=cbShowHelp.checked;
end;

procedure TTestingForm.kanabuttons(Sender: TObject);
begin
  if sbHiragana.down and sbKatakana.down then begin
    Typeoftest:=Kanatest;
    sbHiragana.AllowAllUp:=true;
    sbKatakana.AllowAllUp:=true;
  end else begin
    if sbHiragana.down then Typeoftest:=HiraganaTest;
    if sbKatakana.down then Typeoftest:=KatakanaTest;
    sbHiragana.AllowAllUp:=false;
    sbKatakana.AllowAllUp:=false;
  end;
  Checkwhatlisttoshow(QuestionPanel, lbHelp);
end;

procedure TTestingForm.sbAutosaveWronganswersClick(Sender: TObject);
begin
  form1.sbAutosaveWronganswers.Down:=sbAutosaveWronganswers.Down;
end;

procedure TTestingForm.sbNumberClick(Sender: TObject);
begin
  if sbNumber.Tag<3 then sbNumber.Tag:=sbNumber.Tag+1 else sbNumber.Tag:=1;
  edAnswer.Text:=wTense[sbTense.Tag]+' '+wType[sbType.Tag]+' '
    +wPerson[sbPerson.Tag]+' '+wNumber[sbNumber.Tag];
end;

procedure TTestingForm.sbPersonClick(Sender: TObject);
begin
  if sbPerson.Tag<3 then sbPerson.Tag:=sbPerson.Tag+1 else sbPerson.Tag:=1;
  edAnswer.Text:=wTense[sbTense.Tag]+' '+wType[sbType.Tag]+' '
    +wPerson[sbPerson.Tag]+' '+wNumber[sbNumber.Tag];
end;

procedure TTestingForm.sbRetestMistakesClick(Sender: TObject);
begin
  form1.sbRetestMistakes.Down:=sbRetestMistakes.Down;
  form1.Retestmistakes1.Checked:=sbRetestmistakes.Down;
  form1.sbRetestNine.Down:=sbRetestNine.Down;
  if (not sbRetestmistakes.Down) and (not sbRetestNine.Down) then
    ToRetest.Corrected:=ToRetest.Count
  else
    Every:=ToRetest.Every-1;
end;

procedure TTestingForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if indice<>limite then
  begin
    form1.WindowState:=wsnormal;
    Form1.LogToFile(Form1.Logginglist1, 'Test interrupted...', '1111');
  end;
  TestingForm.WordclassPanel.Visible:=false;
end;

procedure TTestingForm.FormClick(Sender: TObject);
begin
  if
  ((Form1.Pausewhenright1.Checked) and ((QuestionPanel.Color=clGreen)or(QuestionPanel.Color=fdtGreen)))
  or
  ((Form1.Pausewhenwrong1.Checked) and ((QuestionPanel.Color=clRed)or(QuestionPanel.Color=fdtViolet)))
  then
  Timer1Timer(Sender);
end;

procedure TTestingForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  FormClick(Sender);
end;

procedure TTestingForm.ShowWindow(WindowTypeoftest: Unit1.TTypeoftest; WindowCaption, CheckboxCaption: unicodestring);
begin
  if WindowTypeofTest=KanaTest then begin
   cbShowHelp.enabled:=false;
   lbHelp.visible:=false;
   sbHiragana.enabled:=true;
   sbHiragana.down:=true;
   sbKatakana.enabled:=true;
   sbKatakana.down:=True;
   caption:='Write the reading for kana';
  end else begin
   cbShowHelp.Checked:=False;
   lbHelp.visible:=true;
   sbHiragana.enabled:=false;
   sbKatakana.enabled:=false;
   if CheckboxCaption='' then cbShowHelp.Enabled:=False
   else begin
    cbShowHelp.enabled:=true;
    cbShowHelp.caption:=CheckboxCaption;
   end;
   caption:=WindowCaption;
  end;
  TypeofTest:=WindowTypeoftest;
  indice:=0;
  Checkwhatlisttoshow(QuestionPanel, lbHelp);
  Showmodal;
end;

procedure TTestingForm.SpeedButton1Click(Sender: TObject);
begin
Caption:='count:'+inttostr(Toretest.Count)+
  ' -index:'+inttostr(ToRetest.Index)+
  ' -corrected:'+inttostr(ToRetest.Corrected);
end;

procedure TTestingForm.sbTenseClick(Sender: TObject);
begin
  if sbTense.Tag<3 then sbTense.Tag:=sbTense.Tag+1 else sbTense.Tag:=1;
    edAnswer.Text:=wTense[sbTense.Tag]+' '+wType[sbType.Tag]+' '
    +wPerson[sbPerson.Tag]+' '+wNumber[sbNumber.Tag];
end;

procedure TTestingForm.sbTypeClick(Sender: TObject);
begin
  if sbType.Tag<2 then sbType.Tag:=sbType.Tag+1 else sbType.Tag:=1;
    edAnswer.Text:=wTense[sbTense.Tag]+' '+wType[sbType.Tag]+' '
    +wPerson[sbPerson.Tag]+' '+wNumber[sbNumber.Tag];
end;

end.

