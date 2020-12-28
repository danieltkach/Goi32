unit Unit1;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, Spin,
  ComCtrls, ImgList, IniFiles, ToolWin, StrUtils, StdActns, ActnList,
  CheckLst, ShellApi, jpeg;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Archivos1: TMenuItem;
    Salir1: TMenuItem;
    Opciones1: TMenuItem;
    Establecerfuente1: TMenuItem;
    Escritura2: TMenuItem;
    Lectura3: TMenuItem;
    Pronunciacin1: TMenuItem;
    N3: TMenuItem;
    General1: TMenuItem;
    Ayuda1: TMenuItem;
    Acercade1: TMenuItem;
    OpenDialog1: TOpenDialog;
    PanelToolBar1: TPanel;
    sbExitProgram: TSpeedButton;
    SpeedButton8: TSpeedButton;
    btMixLists: TBitBtn;
    Timer1: TTimer;
    PanelSelectedItems: TPanel;
    lbSelectedList1: TLabel;
    lbSelectedList2: TLabel;
    lbSelectedList3: TLabel;
    N5: TMenuItem;
    Vocabulariopredeterminado1: TMenuItem;
    OpenDialog2: TOpenDialog;
    OpenDialog3: TOpenDialog;
    OpenDialog4: TOpenDialog;
    ListBox4: TListBox;
    N6: TMenuItem;
    Time1: TMenuItem;
    N13: TMenuItem;
    N23: TMenuItem;
    N33: TMenuItem;
    N43: TMenuItem;
    N53: TMenuItem;
    StudyMenu: TMenuItem;
    HiraganaKatakana22: TMenuItem;
    HiraganaKatakana32: TMenuItem;
    HiraganaKatakana42: TMenuItem;
    N10: TMenuItem;
    Helptopics1: TMenuItem;
    FontDialog1: TFontDialog;
    sbLoadGroup: TSpeedButton;
    N4: TMenuItem;
    Configuration1: TMenuItem;
    N01: TMenuItem;
    Tools1: TMenuItem;
    Createreadingsfile1: TMenuItem;
    sbClear: TSpeedButton;
    Pausewhenright1: TMenuItem;
    Pausewhenwrong1: TMenuItem;
    ImageList1: TImageList;
    Dontusetimerwhenright1: TMenuItem;
    ImageList2: TImageList;
    Joinwronganswersfiles1: TMenuItem;
    N7: TMenuItem;
    Logtofile1: TMenuItem;
    SaveDialog1: TSaveDialog;
    sbText: TSpeedButton;
    sbLastTested: TSpeedButton;
    StatusBar1: TStatusBar;
    Showlists1: TMenuItem;
    Showselecteditemspanel1: TMenuItem;
    ListsPanel: TPanel;
    sbWrongSaved: TSpeedButton;
    sbLoadOneByOne: TSpeedButton;
    MenuLoad1: TPopupMenu;
    Loadkanjilist1: TMenuItem;
    LoadMeaningslist1: TMenuItem;
    LoadKanareadings1: TMenuItem;
    LoadRomajireadings1: TMenuItem;
    Generatewronganswersreport1: TMenuItem;
    MenuTests1: TPopupMenu;
    Show1write2: TMenuItem;
    Show1write4: TMenuItem;
    Show2write1: TMenuItem;
    Show2write4: TMenuItem;
    Show3write1: TMenuItem;
    Show3write2: TMenuItem;
    sbTests: TSpeedButton;
    N2: TMenuItem;
    Custom1: TMenuItem;
    Autowronganswerstest1: TMenuItem;
    Retestmistakes1: TMenuItem;
    Show1write1: TMenuItem;
    Show1write3: TMenuItem;
    Show2write2: TMenuItem;
    Show2write3: TMenuItem;
    Show3write3: TMenuItem;
    Show3write4: TMenuItem;
    EssentialKanji1: TMenuItem;
    MenuTokanjiTesttype: TPopupMenu;
    Multiplechoice1: TMenuItem;
    Drawthekanji1: TMenuItem;
    Retestevery1: TMenuItem;
    ListBox2: TCheckListBox;
    ListBox3: TCheckListBox;
    ListBox1: TCheckListBox;
    HiraganaKatakana11: TMenuItem;
    Vocabulary1: TMenuItem;
    Register1: TMenuItem;
    FontPopupMenu1: TPopupMenu;
    Font1: TMenuItem;
    N1: TMenuItem;
    Loadallatoncefile1: TMenuItem;
    Logginglist1: TCheckListBox;
    sbRetestMistakes: TSpeedButton;
    sbAutosaveWronganswers: TSpeedButton;
    Autosavewronganswers1: TMenuItem;
    sbRetestNine: TSpeedButton;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    sbSaveGroup: TSpeedButton;
    CreateTest1: TMenuItem;
    btTypesoftest: TBitBtn;
    popupTypesoftest: TPopupMenu;
    Showmainlist1: TMenuItem;
    Askformeaning1: TMenuItem;
    Askforinfo1: TMenuItem;
    Askforreading1: TMenuItem;
    N2Showmeaningslist1: TMenuItem;
    N3Showinfolist1: TMenuItem;
    N4Showreadingslist1: TMenuItem;
    N1Askformainword1: TMenuItem;
    N2Askforinfo1: TMenuItem;
    N3Askforreading1: TMenuItem;
    N1Askformainword2: TMenuItem;
    N2Askformeaning1: TMenuItem;
    N3Askforeading1: TMenuItem;
    N8: TMenuItem;
    N2Askformeaning2: TMenuItem;
    N3Askforinfo2: TMenuItem;
    N1Multiplechoice1: TMenuItem;
    N2Drawthekanji1: TMenuItem;
    N1Multiplechoice2: TMenuItem;
    N1Multiplechoice3: TMenuItem;
    N2Drawthekanji3: TMenuItem;
    btUsername: TSpeedButton;
    panelTestbuttons: TPanel;
    sbReadingtokanji: TSpeedButton;
    sbMeaningtokanji: TSpeedButton;
    sbKanjitomeaning: TSpeedButton;
    sbShow1Askfor3: TSpeedButton;
    sbKanjitoreading: TSpeedButton;
    sbShow2Askfor3: TSpeedButton;
    sbMeaningtoreading: TSpeedButton;
    sbReadingtomeaning: TSpeedButton;
    sbShow3Askfor4: TSpeedButton;
    sbStore1: TSpeedButton;
    N2Drawthekanji2: TMenuItem;
    N9: TMenuItem;
    N5Fillinthegaps1: TMenuItem;
    N1Showwordlist1: TMenuItem;
    N2Donotshowwordlist1: TMenuItem;
    btFillinthegaps: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure ListBox1buClick(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
    procedure btMixListsClick(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure ListBox1buMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure HiraganaKatakana11Click(Sender: TObject);
    procedure HiraganaKatakana21Click(Sender: TObject);
    procedure HiraganaKatakana31Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure HiraganaKatakana41Click(Sender: TObject);
    procedure Escritura2Click(Sender: TObject);
    procedure Pronunciacin1Click(Sender: TObject);
    procedure Lectura3Click(Sender: TObject);
    procedure General1Click(Sender: TObject);
    procedure Configuration1Click(Sender: TObject);
    procedure sbLoadGroupClick(Sender: TObject);
    procedure Createreadingsfile1Click(Sender: TObject);
    procedure sbClearClick(Sender: TObject);
    procedure Joinwronganswersfiles1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbSaveGroupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbTextClick(Sender: TObject);
    procedure sbLastTestedClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Showselecteditemspanel1Click(Sender: TObject);
    procedure Showlists1Click(Sender: TObject);
    procedure sbWrongSavedClick(Sender: TObject);
    procedure sbLoadOneByOneClick(Sender: TObject);
    procedure Loadkanjilist1Click(Sender: TObject);
    procedure LoadMeaningslist1Click(Sender: TObject);
    procedure LoadKanareadings1Click(Sender: TObject);
    procedure LoadRomajireadings1Click(Sender: TObject);
    procedure Generatewronganswersreport1Click(Sender: TObject);
    procedure Show1write2Click(Sender: TObject);
    procedure Show1write4Click(Sender: TObject);
    procedure Show2write4Click(Sender: TObject);
    procedure Show3write2Click(Sender: TObject);
    procedure sbMeaningtokanjiClick(Sender: TObject);
    procedure sbReadingtokanjiClick(Sender: TObject);
    procedure Retestmistakes1Click(Sender: TObject);
    procedure NewItemsClick(Sender: TObject);
    procedure Drawthekanji1Click(Sender: TObject);
    procedure Multiplechoice1Click(Sender: TObject);
    procedure Retestevery1Click(Sender: TObject);
    procedure Helptopics1Click(Sender: TObject);
    procedure Pausewhenright1Click(Sender: TObject);
    procedure Pausewhenwrong1Click(Sender: TObject);
    procedure Dontusetimerwhenright1Click(Sender: TObject);
    procedure Register1Click(Sender: TObject);
    procedure Font1Click(Sender: TObject);
    procedure sbShow1Askfor3Click(Sender: TObject);
    procedure sbShow3Askfor4Click(Sender: TObject);
    procedure sbShow2Askfor3Click(Sender: TObject);
    procedure sbTestsClick(Sender: TObject);
    procedure sbRetestMistakesClick(Sender: TObject);
    procedure sbAutosaveWronganswersClick(Sender: TObject);
    procedure Autosavewronganswers1Click(Sender: TObject);
    procedure CreateTest1Click(Sender: TObject);
    procedure btTypesoftestClick(Sender: TObject);
    procedure btUsernameClick(Sender: TObject);
    procedure Askformeaning1Click(Sender: TObject);
    procedure Askforinfo1Click(Sender: TObject);
    procedure Askforreading1Click(Sender: TObject);
    procedure N1Multiplechoice1Click(Sender: TObject);
    procedure N2Drawthekanji1Click(Sender: TObject);
    procedure N2Askforinfo1Click(Sender: TObject);
    procedure N3Askforreading1Click(Sender: TObject);
    procedure N2Askformeaning1Click(Sender: TObject);
    procedure N3Askforeading1Click(Sender: TObject);
    procedure N1Multiplechoice2Click(Sender: TObject);
    procedure N2Drawthekanji2Click(Sender: TObject);
    procedure N1Showwordlist1Click(Sender: TObject);
    procedure N2Donotshowwordlist1Click(Sender: TObject);
    procedure btFillinthegapsClick(Sender: TObject);
  private
    procedure ListasClickAcertado;
    procedure ListasClickNoAcertado;

    { Private declarations }
  public
    procedure MezclarLista(var lst: array of integer);
    procedure LogToFile(LogName: TCheckListbox; TextToLog: unicodestring; Flag: string);
    function GetAverage: integer;
    procedure UpdateCaptionButtons(Flags: string);
    procedure SaveGoiFile(fName1, fName2, fName3, fName4, fName5, GoiName, Flags, Description: string);
    function LoadGoiFile(Filename: string): boolean;
    procedure FormatText(ToFind: string; Count: integer; Color: TColor; Style, Limit1, Limit2: integer);
    procedure ShowStoredFiles(Filename, Text, Flags: string);
    function GetGroupFileName(FileName, Char1, NewDir: string): string;
    procedure CheckIfAllLoaded;
    function GetRightPath(Filename1, NewDir: string): string;
    procedure Generatewronganswersreport(Filename1, ReportName: string);
    procedure SetAllTimers(Interval1: integer);
    procedure OnoffTestbuttons(Value: boolean);
    function GetLFilename(Fileopened: string): string;
    function FilenameWoPathAndExt(Filename: string): string;
    { Public declarations }
  end;

  TTypeofTest=(NoTest, HiraganaTest, KatakanaTest, KanaTest, KanjiToMeaning,
    KanjiToReading, MeaningToKanji, MeaningToRomaji, ReadingToKanji,
    ReadingToMeaning, RetestMistakes, ttShow1Askfor3, ttShow2Askfor3, ttShow3Askfor4);

  //TWhereFrom=(wfNewlyCreated, wfTestedFiles);
  TWhereFrom=(wfNewlyCreated, wfGoifile, wfStored, wfWrongAnswers);
  TDevoto=(nocantanrondastodavia, canta16, siguelosprincipios, puro);

  TVocReg = record
    Filename: string[200];
    Description: string[200];
    Average: integer;
    Date: string[100];
    Active: boolean;
  end;

  TVocFile = file of TVocReg;

  TStringArray = array of unicodestring;

  TStoredFile=record
    Description: string;
    Average: integer;
    Date: string;
  end;

  TStorageData=record
      InResults: boolean;
      InWrongs: boolean;
      Results: TStoredFile;
      Wrongs: TStoredFile;
    end;

  TGoiFile=record
    Name: string;
    Files: array[1..5] of string;
    Description: string;
    CurrentAverage: integer;
    StorageData: TStorageData;
    CurrentTypeofTest: TTypeoftest;
    TimesTested: integer;
    PerfectScore: boolean;
    WrongAnswersFilename: array[1..10] of string;
    WhereFrom: TWhereFrom;
    //State: TGoifileState;
  end;


const
  LogFile1='GoiLog1.txt';

var
  ResultsFilename: string ='Results.g32';
  WrongsFilename: string ='WrongAns.g32';
  goiUsername: string ='Default';

  Form1: TForm1;
  lista11, lista22, lista33, lista44: array of unicodestring;
  l1, l2, l3, l4: array of integer;
  limite: integer;

  AppPath, VocabularyPath, EssentialKanjiPath: string;
  FileOpened: TGoifile;

  lAverage, ConstRetestEvery, ToRetestLimit: integer;
  //ToRetestLimit --> Máxima cantidad de palabras para retest.
  FilenamesList: TStringArray;
  NumResultsStored, NumWrongsStored: integer;
  TypeofTest: TTypeofTest;
  c: char;

  FirstTimeRun: boolean;
  RegistrationPassword: string;

  tempTexttolog: string;

  TotalWordsInArchive: integer;

  implementation

uses uTesting1, Unit3, Unit4, Unit5, uReadings1 , uJoinFiles, uStartup, uText, uTestedFiles,
  uDescription, uReportWindow, uToKanji, uMultipleChoice, uRegistration1,
  uUsersWindow, uFillinthegaps;

{$R *.DFM}

procedure TForm1.MezclarLista(var lst: array of integer);
var
  aa, bb, cc, num, lstlength: integer;
begin
  lstlength:=Length(lst)-1;
  //Si algo se cuelga, cambiar lstlength por limite en las próximas líneas
  for aa:=0 to lstlength do lst[aa]:=-1;
  aa:=0;
  while (aa<=lstlength) do begin
    num:=random(lstlength+1);
    cc:=0;
    for bb:=0 to lstlength do if num=lst[bb] then cc:=1;
    if cc=0 then begin lst[aa]:=num; aa:=aa+1;end;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  Ini: TIniFile;
  srFiles: TSearchRec;
  EssKanjiMenu, Vocabulary1Menu: TMenuItem;
begin

//fmRegistration.ShowModal;
//fmStartup.ShowModal;
//Showmessage('Beta version. May be buggy.');
  //Application.Terminate;

  randomize;
  limite:=0;

  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try

    AppPath:=Ini.ReadString('Options', 'Application path',
      'c:\Goi32\');

    VocabularyPath:=Ini.ReadString('Options', 'Vocabulary path',
      'c:\Goi32\Vocabulary\');

    EssentialKanjiPath:=Ini.ReadString('Options', 'Essential Kanji path',
      'c:\Goi32\Essential Kanji\');

    RegistrationPassword:=Ini.ReadString('Options', 'Registration Password', '');
    FirstTimeRun:=Ini.ReadBool('Options', 'First time run', True);

    ConstRetestEvery:=Ini.ReadInteger('Options', 'Retest every', 4);
    ToRetestLimit:=Ini.ReadInteger('Options', 'Max to retest', 9);

    if FirstTimeRun then Helptopics1Click(Sender);
  finally
    Ini.Free;
  end;

  lAverage:=0;
  Updatecaptionbuttons('0');
{
  if FindFirst(EssentialKanjiPath+'*.goi', faArchive, srFiles) = 0 then begin
    repeat
      EssKanjiMenu:=TMenuItem.Create(EssentialKanji1);
      EssentialKanji1.Add(EssKanjiMenu);
      EssKanjiMenu.Caption:=EssentialKanjiPath+srFiles.Name; //Fileopened;
      EssKanjiMenu.OnClick:=NewItemsClick;
    until FindNext(srFiles) <> 0;
  end;
}
  if FindFirst(VocabularyPath+'*.goi', faArchive, srFiles) = 0 then begin
    repeat
      Vocabulary1Menu:=TMenuItem.Create(Vocabulary1);
      Vocabulary1.Add(Vocabulary1Menu);
      Vocabulary1Menu.Caption:=VocabularyPath+srFiles.Name; //Fileopened;
      Vocabulary1Menu.OnClick:=NewItemsClick;
    until FindNext(srFiles) <> 0;
  end;

  //FindClose(srFiles);
  //fmStartup.ShowModal;
form1.sbClear.Click;
end;


procedure TForm1.ListBox1buClick(Sender: TObject);
begin
  lbSelectedList1.caption:=listbox1.items[listbox1.itemindex];
  lbSelectedList2.caption:=listbox2.items[listbox2.itemindex];
  lbSelectedList3.caption:=listbox3.items[listbox3.itemindex];
end;

procedure TForm1.Salir1Click(Sender: TObject);
begin
  Close;
end;


procedure TForm1.NewItemsClick(Sender: TObject);
var
  i, j: integer;
  tempName, Filename, ItemCaption: string[254];
begin
  j:=0;
  ItemCaption:=(Sender as TMenuItem).Caption;
  for i:=0 to Length(ItemCaption) do begin
    if ItemCaption[i]<>'&' then begin
      tempName[j]:=ItemCaption[i];
      inc(j);
    end;
  end;
  Filename:=Copy(tempName, 1, Length(tempName)-1);
  LoadGoiFile(Filename);
  form1.btMixLists.Click;
end;


procedure TForm1.Askforinfo1Click(Sender: TObject);
begin
 //TestingForm.WordclassPanel.Visible:=true;
  LogToFile(Form1.Logginglist1, '"Show list 1, ask for list 3 " test started...', '1110');
  form1.WindowState:=wsminimized;
  Fileopened.CurrentTypeofTest:=ttShow1Askfor3;
  TestingForm.ShowWindow(ttShow1Askfor3, 'Write the info required for the word', 'Show meaning');
end;

procedure TForm1.Askformeaning1Click(Sender: TObject);
begin
  LogToFile(Form1.Logginglist1, '"Show list 1, ask for list 2" test started...', '1110');
  form1.WindowState:=wsminimized;
  Fileopened.CurrentTypeofTest:=Kanjitomeaning;
  TestingForm.ShowWindow(KanjiToMeaning, 'Write the meaning of the word', 'Show info');
end;

procedure TForm1.Askforreading1Click(Sender: TObject);
var
  tempTypeofTest: TTypeoftest;
begin
  LogToFile(Form1.Logginglist1, '"Show list 1, ask for list 4" test started...', '1110');
  form1.WindowState:=wsminimized;
  if Typeoftest<>Kanatest then tempTypeoftest:=KanjiToReading
    else tempTypeoftest:=Kanatest;
  Fileopened.CurrentTypeofTest:=tempTypeoftest;
  TestingForm.ShowWindow(tempTypeofTest, 'Write the reading of the word', 'Show meaning');
end;

procedure TForm1.Autosavewronganswers1Click(Sender: TObject);
begin
sbAutosaveWronganswers.Down:=AutosaveWronganswers1.Checked;
end;

procedure TForm1.btFillinthegapsClick(Sender: TObject);
begin
  form1.WindowState:=wsMinimized;
  fmFillinthegaps.ShowModal;
end;

procedure TForm1.btMixListsClick(Sender: TObject);
var
  aa, lb1count, lb2count, lb3count, lb4count: integer;
begin
  {
  EssKanjiMenu:=TMenuItem.Create(EssentialKanji1);
  EssentialKanji1.Add(EssKanjiMenu);
  EssKanjiMenu.Caption:=Fileopened;
  EssKanjiMenu.OnClick:=EssKanjiNewItemsClick;
  }

//Stores the quantity of items in each list in a variable to make things easier.
  lb1count:=Listbox1.Items.Count;
  lb2count:=Listbox2.Items.Count;
  lb3count:=Listbox3.Items.Count;
  lb4count:=Listbox4.Items.Count;

  btMixLists.enabled:=false;

  if Typeoftest=KanaTest then begin
    OnoffTestbuttons(False);
    sbKanjitoreading.Enabled:=True;
    //sbTests.Enabled:=False;
  end
  else
  begin
    sbTests.Enabled:=True;
    OnoffTestbuttons(True);
  end;
  StudyMenu.Enabled:=true;

  //*** PLEASE FIX THIS PART WHICH IS HORRIBLE!!! ***
  if (lb1count <= lb2count)
  and (lb1count <= lb3count)
  and (lb1count <= lb4count)
  then Limite:=lb1count-1;

  if (lb2count <= lb1count)
  and (lb2count <= lb3count)
  and (lb2count <= lb4count)
  then Limite:=lb2count-1;

  if (lb3count <= lb2count)
  and (lb3count <= lb1count)
  and (lb3count <= lb4count)
  then Limite:=lb3count-1;

  if (lb4count <= lb1count)
  and (lb4count <= lb2count)
  and (lb4count <= lb3count)
  then Limite:=lb4count-1;

  SetLength(l1, Limite+1);
  SetLength(l2, Limite+1);
  SetLength(l3, Limite+1);
  SetLength(l4, Limite+1);
  SetLength(lista11, Limite+1);
  SetLength(lista22, Limite+1);
  SetLength(lista33, Limite+1);
  SetLength(lista44, Limite+1);

//Load from the list boxes into the arrays in memory.
//This load process should be done from the FILES instead...

  for aa:=0 to limite do lista11[aa]:=listbox1.items[aa];
  for aa:=0 to limite do lista22[aa]:=listbox2.items[aa];
  for aa:=0 to limite do lista33[aa]:=listbox3.items[aa];
  for aa:=0 to limite do lista44[aa]:=listbox4.items[aa];
//Mixes the four lists generating random numbers.
  mezclarlista(l1);
  mezclarlista(l2);
  mezclarlista(l3);
  mezclarlista(l4);
//Fills the list boxes with the mixed lists.
  for aa:=0 to limite do listbox1.Items[aa]:=lista11[l1[aa]];
  for aa:=0 to limite do listbox2.Items[aa]:=lista22[l2[aa]];
  for aa:=0 to limite do listbox3.Items[aa]:=lista33[l3[aa]];
  for aa:=0 to limite do listbox4.Items[aa]:=lista44[l4[aa]];
//Selects the first element and shows it in the panel below the list boxes.
  listbox1.enabled:=true;
  listbox2.enabled:=true;
  listbox3.enabled:=true;
  listbox1.itemindex:=0;
  listbox2.itemindex:=0;
  listbox3.itemindex:=0;
  lbSelectedList1.caption:=listbox1.items[listbox1.itemindex];
  lbSelectedList2.caption:=listbox2.items[listbox2.itemindex];
  lbSelectedList3.caption:=listbox3.items[listbox3.itemindex];

  //btMixLists.enabled:=True;
  btTypesoftest.Enabled:=true;
  btTypesoftest.SetFocus;
end;

procedure TForm1.btTypesoftestClick(Sender: TObject);
begin
  popupTypesoftest.Popup((sender as tbitbtn).Left+left,(sender as tbitbtn).top+top);
end;

procedure TForm1.btUsernameClick(Sender: TObject);
begin
  UsersWindow.Showmodal;
end;

procedure TForm1.SpeedButton8Click(Sender: TObject);
begin
  AboutForm.showmodal;
end;

procedure TForm1.ListBox1buMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (button=mbright)and(listbox1.enabled) and(listbox2.enabled)and(listbox3.enabled)
  then begin
  ////////////////////////////////////////////////////////
  if ((l1[listbox1.itemindex])=(l2[listbox2.itemindex]))and
    ((l1[listbox1.itemindex])=(l3[listbox3.itemindex]))
  then ListasClickAcertado
  else ListasClickNoAcertado;
  ////////////////////////////////////////////////////////
  end;
end;

procedure TForm1.ListasClickAcertado;
var
  aa: integer;
begin
  for aa:=(listbox1.itemindex) to limite do l1[aa]:=l1[aa+1];
  for aa:=(listbox2.itemindex) to limite do l2[aa]:=l2[aa+1];
  for aa:=(listbox3.itemindex) to limite do l3[aa]:=l3[aa+1];
  ListsPanel.color:=clgreen;
  timer1.tag:=1;{quiere decir que fue acierto}
  listbox1.enabled:=false;
  listbox2.enabled:=false;
  listbox3.enabled:=false;
  timer1.enabled:=true;
end;

procedure TForm1.ListasClickNoAcertado;
begin
  timer1.tag:=0; {quiere decir que no fue acertado}
  listbox1.enabled:=false;
  listbox2.enabled:=false;
  listbox3.enabled:=false;
  ListsPanel.color:=clred;
  timer1.enabled:=true;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  timer1.enabled:=false;
  //Move this part to FueAcertado().
  if (limite>=0) and (Timer1.Tag=1) then begin
    listbox1.items.delete(listbox1.itemindex);
    listbox2.items.delete(listbox2.itemindex);
    listbox3.items.delete(listbox3.itemindex);
    limite:=limite-1;
  end;

  if limite<0 then begin
    Statusbar1.Panels[0].Text:='';
    Statusbar1.Panels[1].Text:='0 line(s) loaded';
    Statusbar1.Panels[2].Text:='Current average: 0%';
    Caption:='Goi - No files loaded';
    Fileopened.Name:='';
    Fileopened.Description:='';
    lbSelectedList1.caption:='- - -';
    lbSelectedList2.caption:='- - -';
    lbSelectedList3.caption:='- - -';
    btMixLists.enabled:=false;
    listbox1.enabled:=false;
    listbox2.enabled:=false;
    listbox3.enabled:=false;
    //sbTests.Enabled:=False;
    OnoffTestbuttons(False);
    sbClearClick(Sender);
  end else begin
    listbox1.enabled:=true;
    listbox2.enabled:=true;
    listbox3.enabled:=true;
    listbox1.itemindex:=0;
    listbox2.itemindex:=0;
    listbox3.itemindex:=0;
    lbSelectedList1.caption:=listbox1.items[listbox1.itemindex];
    lbSelectedList2.caption:=listbox2.items[listbox2.itemindex];
    lbSelectedList3.caption:=listbox3.items[listbox3.itemindex];
  end;
  ListsPanel.color:=clsilver;
  //btMixLists.Enabled:=True;
end;

procedure TForm1.HiraganaKatakana11Click(Sender: TObject);
begin
  TypeofTest:=KanaTest;
  Loadgoifile(VocabularyPath+'Kana\Kana1.goi');
end;

procedure TForm1.HiraganaKatakana21Click(Sender: TObject);
begin
  TypeofTest:=KanaTest;
  Loadgoifile(VocabularyPath+'Kana\Kana2.goi');
end;

procedure TForm1.HiraganaKatakana31Click(Sender: TObject);
begin
  TypeofTest:=KanaTest;
  Loadgoifile(VocabularyPath+'Kana\Kana3.goi');
end;

procedure TForm1.HiraganaKatakana41Click(Sender: TObject);
begin
  TypeofTest:=KanaTest;
  Loadgoifile(VocabularyPath+'Kana\Kana4.goi');
end;

procedure TForm1.SetAllTimers(Interval1: integer);
begin
  Timer1.Interval:=Interval1;
  TestingForm.Timer1.Interval:=Interval1;
end;

procedure TForm1.N13Click(Sender: TObject);
begin
  SetAllTimers((Sender as TMenuItem).Tag);
  (Sender as TMenuItem).Checked:=True;
end;

procedure TForm1.N1Multiplechoice1Click(Sender: TObject);
begin
  TypeofTest:=MeaningToKanji;
  LogToFile(Form1.Logginglist1, 'Multiple choice test started...', '1110');
  form1.WindowState:=wsminimized;
  fmMultipleChoice.Showmodal;
end;

procedure TForm1.N1Multiplechoice2Click(Sender: TObject);
begin
  Typeoftest:=ReadingtoKanji;
  LogToFile(Form1.Logginglist1, 'Multiple choice test started...', '1110');
  form1.WindowState:=wsminimized;
  fmMultipleChoice.Showmodal;
end;

procedure TForm1.N1Showwordlist1Click(Sender: TObject);
begin
  fmFillinthegaps.showmodal;
end;

procedure TForm1.N2Askforinfo1Click(Sender: TObject);
begin
  //TestingForm.WordclassPanel.Visible:=true;
  LogToFile(Form1.Logginglist1, '"Show list 2, ask for list 3 " test started...', '1110');
  form1.WindowState:=wsminimized;
  Fileopened.CurrentTypeofTest:=ttShow2Askfor3;
  TestingForm.ShowWindow(ttShow2Askfor3, 'Write the info for the meaning word', 'Show word');
end;

procedure TForm1.N2Askformeaning1Click(Sender: TObject);
begin
  LogToFile(Form1.Logginglist1, '"Show list 3, ask for list 2" test started...', '1110');
  form1.WindowState:=wsminimized;
  Fileopened.CurrentTypeofTest:=Readingtomeaning;
  TestingForm.ShowWindow(ReadingToMeaning, 'Write the meaning for the word whose info is shown', 'Show kanji');
end;

procedure TForm1.N2Donotshowwordlist1Click(Sender: TObject);
begin
  fmFillinthegaps.showmodal;
end;

procedure TForm1.N2Drawthekanji1Click(Sender: TObject);
begin
  TypeofTest:=MeaningToKanji;
  LogToFile(Form1.Logginglist1, 'Drawing test started...', '1110');
  form1.WindowState:=wsminimized;
  fmToKanji.Showmodal;
end;

procedure TForm1.N2Drawthekanji2Click(Sender: TObject);
begin
  Typeoftest:=ReadingtoKanji;
  LogToFile(Form1.Logginglist1, 'Drawing test started...', '1110');
  form1.WindowState:=wsminimized;
  fmToKanji.Showmodal;
end;

procedure TForm1.N3Askforeading1Click(Sender: TObject);
begin
  LogToFile(Form1.Logginglist1, '"Show list 3, ask for list 4 " test started...', '1110');
  form1.WindowState:=wsminimized;
  Fileopened.CurrentTypeofTest:=ttShow3Askfor4;
  TestingForm.ShowWindow(ttShow3Askfor4, 'Write the reading for the word whose info is shown', 'Show meaning');
end;

procedure TForm1.N3Askforreading1Click(Sender: TObject);
begin
  LogToFile(Form1.Logginglist1, '"Show list 2, ask for list 4" test started...', '1110');
  form1.WindowState:=wsminimized;
  Fileopened.CurrentTypeofTest:=Meaningtoromaji;
  TestingForm.ShowWindow(Meaningtoromaji, 'Write the trasliteration for the meaning of the word', '');
end;

procedure TForm1.Escritura2Click(Sender: TObject);
begin
if fontdialog1.execute then listbox1.Font:=fontdialog1.Font;
end;

procedure TForm1.Pronunciacin1Click(Sender: TObject);
begin
if fontdialog1.execute then listbox2.Font:=fontdialog1.Font;
end;

procedure TForm1.Lectura3Click(Sender: TObject);
begin
if fontdialog1.execute then listbox3.Font:=fontdialog1.Font;
end;

procedure TForm1.General1Click(Sender: TObject);
begin
  if fontdialog1.execute then begin
  listbox1.Font:=fontdialog1.Font;
  listbox2.Font:=fontdialog1.Font;
  listbox3.Font:=fontdialog1.Font;
  end;
end;

procedure TForm1.Configuration1Click(Sender: TObject);
begin
ConfigForm.Showmodal;
end;

procedure TForm1.sbLoadGroupClick(Sender: TObject);
begin
OpenDialog1.Filter:='Goi group files (*.goi)';
Opendialog1.InitialDir:=AppPath;
if opendialog1.execute then
  begin
    FileOpened.Name:=OpenDialog1.FileName;
    Fileopened.CurrentTypeofTest:=NoTest;
    StoredlistIndex:=-1; WrongslistIndex:=-1;
    if ExtractFileExt(Fileopened.Name)='.goi' then LoadGoiFile(Fileopened.Name);

    //Mezcla las listas
    form1.btMixLists.Click;
  end;
end;

function TForm1.FilenameWoPathAndExt(Filename: string): string;
begin
FilenameWoPathAndExt:=
      Copy(ExtractFileName(Filename),0,
        Length(
        ExtractFileName(Filename)
        )-4);
end;

function TForm1.LoadGoiFile(Filename: string): boolean;
var
  File1: TextFile;
  fLine, flDescription: string;
begin
  if FileExists(Filename) then begin

  Fileopened.Name:=Filename;
  lAverage:=GetAverage;
  AssignFile(File1, FileName);
  Reset(File1);
  Readln(File1, flDescription);
  Fileopened.Description:=flDescription;
  Readln(File1, fLine);
  OpenDialog1.FileName:=fLine;
  Readln(File1, fLine);
  OpenDialog2.FileName:=fLine;
  Readln(File1, fLine);
  OpenDialog3.FileName:=fLine;
  Readln(File1, fLine);
  OpenDialog4.FileName:=fLine;
  CloseFile(File1);
//Tengo que leer línea por línea del archivo para codificarlas en unicode... porque
//así se carga basura...
//MEJOR!! Cuando grabo el archivo de respuestas incorrectas no hace falta que grabe
//item por item, se puede grabar todo de una?? listbox.save???
  listbox1.items.loadfromfile(opendialog1.filename);
  listbox2.items.loadfromfile(opendialog2.filename);
  listbox3.items.loadfromfile(opendialog3.filename);
  listbox4.items.loadfromfile(opendialog4.filename);
  UpdateCaptionButtons('1');

  LoadGoiFile:=True;
  sbLastTested.Enabled:=False;
  sbWrongSaved.Enabled:=False;
  if Typeoftest=Kanatest then sbStore1.Enabled:=False;
  end //if FileExists(Filename) then begin
  else begin
    Fileopened.Name:='';
    LoadGoiFile:=False;
    ShowMessage('File does not exist!');
  end;
  Fileopened.WhereFrom:=wfGoifile;//ENCONTRÉ UN BUG RELACIONADO A WHEREFROM. SI
  //SOLAMENTE* ABRO LA VENTANA DE ERRORES Y DESPUES CARGO UN .GOI, EL PROGRAMA
  //PIENSA QUE EL ARCHIVO SE CARGÓ DE WRONG ANSWERS. JAJA. :-)
  Logginglist1.Items.Clear;
end;


procedure TForm1.UpdateCaptionButtons(Flags: string);
begin
  //BUG:________________________________________________________________________
  //Siempre alguna de las dos variables va a ser -1, por eso esta línea siempre
  //es verdadera en el ámbito del programa...
  //----------------------------------------------------------------------------
  {if ((StoredlistIndex=-1)and()
  or
  ((WrongslistIndex=-1)and()
  then}
  lAverage:=GetAverage;
  lAverage:=Fileopened.CurrentAverage;

  Statusbar1.Panels[0].Text:=Fileopened.Name;
  Statusbar1.Panels[1].Text:=Inttostr(Listbox1.Items.Count)+' line(s) loaded';
  Statusbar1.Panels[2].Text:='Current average: '+Inttostr(lAverage)+'%';

  if Fileopened.Name='' then begin
  Caption:='Goi - No files loaded'
  end
  else
  begin
    //Caption:='Goi - '+FileDescription;
    Caption:='Goi - '+Fileopened.Description;

    if Flags='1' then begin
    Listbox1.Enabled:=False;
    Listbox2.Enabled:=False;
    Listbox3.Enabled:=False;
    Listbox4.Enabled:=False;
    btMixLists.enabled:=true;
    //sbTests.Enabled:=False;
    OnoffTestbuttons(False);
    sbSaveGroup.Enabled:=True;
    sbStore1.Enabled:=True;
    {if subKanjitomeaning1.Checked then begin
      btMixLists.Click;
      Show1Write2Click(Show1Write2);
    end;  }
    sbLoadOneByOne.Enabled:=False;
    end;
  end;
end;

procedure TForm1.Createreadingsfile1Click(Sender: TObject);
begin
  fmReadings.Showmodal;
end;

procedure TForm1.CreateTest1Click(Sender: TObject);
begin
  fmJoinfiles.ShowModal;
end;

procedure TForm1.sbAutosaveWronganswersClick(Sender: TObject);
begin
  AutosaveWronganswers1.Checked:=sbAutosaveWronganswers.Down;
end;

procedure TForm1.sbClearClick(Sender: TObject);
begin
  btTypesoftest.enabled:=false;
  sbLastTested.Enabled:=True;
  sbWrongSaved.Enabled:=True;
  TypeofTest:=NoTest;
  Fileopened.Name:='';
  Fileopened.Description:='';
  Fileopened.CurrentAverage:=0;
  Fileopened.CurrentTypeofTest:=NoTest;
  StoredlistIndex:=-1; WrongslistIndex:=-1;

  lista11:=nil;
  lista22:=nil;
  lista33:=nil;
  lista44:=nil;
  l1:=nil;
  l2:=nil;
  l3:=nil;
  l4:=nil;
  wronga:=nil;
  righta:=nil;
  wrongaindex:=nil;
  rightaindex:=nil;

  listbox1.Clear; listbox1.Enabled:=False;
  listbox2.Clear; listbox2.Enabled:=False;
  listbox3.Clear; listbox3.Enabled:=False;
  listbox4.Clear; listbox4.Enabled:=False;
  sbLoadOneByOne.Enabled:=True;
  LoadKanjiList1.Checked:=False;
  LoadMeaningsList1.Checked:=False;
  LoadKanaReadings1.Checked:=False;
  LoadRomajiReadings1.Checked:=False;
  //sbTests.Enabled:=False;
  OnoffTestbuttons(False);
  btMixLists.Enabled:=False;
  StudyMenu.Enabled:=False;
  sbSaveGroup.Enabled:=False;
  sbStore1.Enabled:=False;
  lbSelectedList1.Caption:='---';
  lbSelectedList2.Caption:='---';
  lbSelectedList3.Caption:='---';
  Opendialog1.FileName:='';
  Opendialog2.FileName:='';
  Opendialog3.FileName:='';
  Opendialog4.FileName:='';
  Limite:=0;
  UpdateCaptionButtons('1');
  Logginglist1.Items.Clear;
end;

procedure TForm1.Joinwronganswersfiles1Click(Sender: TObject);
begin
  fmJoinFiles.Showmodal;
end;

procedure TForm1.LogToFile(LogName: TCheckListbox; TextToLog: unicodestring; Flag: string);
var
  DateTime: string;
begin
  if LogToFile1.Checked then begin
  DateTime:=DateTimeToStr(Now);

  if FileExists(Form1.GetLFilename(Fileopened.Name)) then
    Logginglist1.Items.LoadFromFile(Form1.GetLFilename(Fileopened.Name));
  end
  else begin
    Logginglist1.Items.Clear;
    Logname.Items.Add(Fileopened.Description);
    Logname.Items.Add('');
    Logname.Items.Add('*********************************************');
    Logname.Items.Add('* Created: '+Datetimetostr(Now)+'*');
    Logname.Items.Add('*********************************************');
    Logname.Items.Add('');
    Logname.Items.Add('________________________________________________');
    Logname.Items.Add('');
  end;

  if Flag[1]='1' then Logname.Items.Add('['+DateTime+']');
  if Flag[3]='1' then tempTexttolog:=' --> ';
  //if Flag[2]='1' then Logname.Items.Add(TextToLog)
                 //else tempTexttolog:=Texttolog;
  //if Flag[4]='1' then Logname.Items.Add('');

  if Flag[2]='1' then begin
    Logname.Items.Add(tempTexttolog+Texttolog);
    tempTexttolog:='';
  end
  else tempTexttolog:=tempTexttolog+Texttolog;

  if Logname=Form1.Logginglist1 then
    Logginglist1.Items.SaveToFile(Form1.GetLFilename(Fileopened.Name), TEncoding.Unicode);

  end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try
    Ini.WriteBool( 'Options', 'Do not use timer when right',
      Dontusetimerwhenright1.Checked);
    Ini.WriteBool( 'Options', 'Wait for click when right',
      Pausewhenright1.Checked);
    Ini.WriteBool( 'Options', 'Retest mistakes', RetestMistakes1.Checked);
    Ini.WriteInteger( 'Options', 'Max to retest', ToRetestLimit);
    Ini.WriteBool( 'Options', 'Retest limited', sbRetestNine.Down);
    Ini.WriteBool( 'Options', 'Wait for click when wrong', Pausewhenwrong1.Checked);
    Ini.WriteBool( 'Options', 'Log to file', Logtofile1.Checked);

    FirstTimeRun:=False;
    Ini.WriteBool('Options', 'First time run', FirstTimeRun);
  finally
    Ini.Free;
  end;
end;

procedure TForm1.sbSaveGroupClick(Sender: TObject);
var
  GoiName: string;
begin
  if Savedialog1.Execute then begin
    GoiName:=Savedialog1.FileName;
    SaveGoiFile(Opendialog1.FileName, Opendialog2.FileName,
      Opendialog3.FileName, Opendialog4.FileName, '', GoiName, '11', '');
  end;
end;

procedure TForm1.sbShow1Askfor3Click(Sender: TObject);
begin
  //TestingForm.WordclassPanel.Visible:=true;
  LogToFile(Form1.Logginglist1, '"Show list 1, ask for list 3 " test started...', '1110');
  form1.WindowState:=wsminimized;
  Fileopened.CurrentTypeofTest:=ttShow1Askfor3;
  TestingForm.ShowWindow(ttShow1Askfor3, 'Write the info required for the word', 'Show meaning');
end;

procedure TForm1.sbShow2Askfor3Click(Sender: TObject);
begin
  //TestingForm.WordclassPanel.Visible:=true;
  LogToFile(Form1.Logginglist1, '"Show list 2, ask for list 3 " test started...', '1110');
  form1.WindowState:=wsminimized;
  Fileopened.CurrentTypeofTest:=ttShow2Askfor3;
  TestingForm.ShowWindow(ttShow2Askfor3, 'Write the info for the meaning word', 'Show word');
end;

procedure TForm1.sbShow3Askfor4Click(Sender: TObject);
begin
  LogToFile(Form1.Logginglist1, '"Show list 3, ask for list 4 " test started...', '1110');
  form1.WindowState:=wsminimized;
  Fileopened.CurrentTypeofTest:=ttShow3Askfor4;
  TestingForm.ShowWindow(ttShow3Askfor4, 'Write the reading for the word whose info is shown', 'Show meaning');
end;

function TForm1.GetRightPath(Filename1, NewDir: string): string;
var
  GoiPath, fPath, fName, TopDir: string;
begin
  GoiPath:=ExtractFilePath(Savedialog1.FileName);
  fPath:=ExtractFilePath(Filename1);
  fName:=ExtractFileName(FileName1);
  TopDir:=RightStr(fPath, Length(NewDir)+1);

if  NewDir+'\' <> TopDir
  then begin
    Renamefile(FileName1, GoiPath+NewDir+'\'+fName);
    GetRightPath:=GoiPath+NewDir+'\'+fName;
  end
  else
    GetRightPath:=Filename1;

  //FileSetAttr(Filename1, faHidden);
  //FileSetAttr(GoiPath+NewDir, faHidden);
end;

procedure TForm1.SaveGoiFile(fName1, fName2, fName3, fName4, fName5, GoiName, Flags, Description: string);
//Flags[1]: 1-                2-
//Flags[2]: 1-Save new file(Copy), 2- Rename and move
var
  GoiFile: TextFile;
  NewDir, NewFilePath: string;
  gLine: string;
begin
  if fName5='' then fName5:=GetGroupFileName(GoiName, 'l', '');

  //GetRightPath()
  NewDir:=Copy(ExtractFileName(Goiname), 1, Length(ExtractFileName(Goiname))-4);

  //Esta funcion debe tener el directorio completo para evitar bugs.
  CreateDir(ExtractFilePath(Goiname)+NewDir);

  //Puede ser... CreateDir(ExpandFilePath(Goiname)+FilenameWoExtension(Extractfilename(Goiname));
//CreateDir(ExpandFilePath(Goiname)+FilenameWoExtension(Extractfilename(Goiname));
  if Flags[2]='1' then begin
    Copyfile(PCHAR(fName1), PCHAR(ExtractFilePath(GoiName)+NewDir+'\'+ExtractFilename(fName1)), FALSE);
    Copyfile(PCHAR(fName2), PCHAR(ExtractFilePath(GoiName)+NewDir+'\'+ExtractFilename(fName2)), FALSE);
    Copyfile(PCHAR(fName3), PCHAR(ExtractFilePath(GoiName)+NewDir+'\'+ExtractFilename(fName3)), FALSE);
    Copyfile(PCHAR(fName4), PCHAR(ExtractFilePath(GoiName)+NewDir+'\'+ExtractFilename(fName4)), FALSE);
    AssignFile(GoiFile, Fileopened.Name);
    Reset(GoiFile);
    Readln(GoiFile, gLine); //Reads description
    Readln(GoiFile, gLine);Readln(GoiFile, gLine); //Reads file 1 and 2
    Readln(GoiFile, gLine);Readln(GoiFile, gLine); //Reads file 3 and 4
    Readln(GoiFile, gLine); //Reads L file
    if FileExists(gLine) then fName5:=gLine;
    CloseFile(GoiFile);
    Copyfile(PCHAR(fName5), PCHAR(ExtractFilePath(GoiName)+NewDir+'\'+ExtractFilename(fName5)), FALSE);

    if FileExists(GoiName) {and (ConfigForm.chkDelListFiles1.Checked)}
     then begin
      DeleteFile(PCHAR(fName1));
      DeleteFile(PCHAR(fName2));
      DeleteFile(PCHAR(fName3));
      DeleteFile(PCHAR(fName4));
      DeleteFile(PCHAR(fName5));
    end;
  end;

  if Flags[2]='2' then begin
    NewFilePath:=ExtractFilePath(GoiName)+NewDir+'\';
    if FileExists(NewFilePath+ExtractFilename(fName1)) then begin
      Sysutils.Deletefile(NewFilePath+ExtractFilename(fName1));
      Sysutils.Deletefile(NewFilePath+ExtractFilename(fName2));
      Sysutils.Deletefile(NewFilePath+ExtractFilename(fName3));
      Sysutils.Deletefile(NewFilePath+ExtractFilename(fName4));
      Sysutils.Deletefile(NewFilePath+ExtractFilename(fName5));
    end;
    if not Renamefile(fName1, ExtractFilePath(GoiName)+NewDir+'\'+ExtractFilename(fName1)) then Showmessage('Rename failed');
    Renamefile(fName2, ExtractFilePath(GoiName)+NewDir+'\'+ExtractFilename(fName2));
    Renamefile(fName3, ExtractFilePath(GoiName)+NewDir+'\'+ExtractFilename(fName3));
    Renamefile(fName4, ExtractFilePath(GoiName)+NewDir+'\'+ExtractFilename(fName4));
    Renamefile(fName5, ExtractFilePath(GoiName)+NewDir+'\'+ExtractFilename(fName5));
  end;

  fName1:=ExtractFilePath(GoiName)+NewDir+'\'+ExtractFilename(fName1);
  fName2:=ExtractFilePath(GoiName)+NewDir+'\'+ExtractFilename(fName2);
  fName3:=ExtractFilePath(GoiName)+NewDir+'\'+ExtractFilename(fName3);
  fName4:=ExtractFilePath(GoiName)+NewDir+'\'+ExtractFilename(fName4);
  fName5:=ExtractFilePath(GoiName)+NewDir+'\'+ExtractFilename(fName5);
  {FileSetAttr(fName1, faHidden);
  FileSetAttr(fName2, faHidden);
  FileSetAttr(fName3, faHidden);
  FileSetAttr(fName4, faHidden);
  FileSetAttr(fName5, faHidden);
  FileSetAttr(ExtractFilePath(GoiName)+NewDir, faHidden);}

  AssignFile(GoiFile, GoiName);
  Rewrite(GoiFile);
  Writeln(GoiFile, Description);
  Writeln(GoiFile, fName1);
  Writeln(GoiFile, fName2);
  Writeln(GoiFile, fName3);
  Writeln(GoiFile, fName4);
  Writeln(GoiFile, fName5);
  Writeln(GoiFile, Inttostr(Listbox1.Items.Count));
  CloseFile(GoiFile);
  //fmResults.StoreFile(ResultsFilename,GoiName,Description,0);
end;

function TForm1.GetGroupFileName(FileName, Char1, NewDir: string): string;
begin
  //Acá no hay por qué crear un directorio. La función tiene que servir para más
  //para lo que se supone que hace; tiene que formatear un string y nada más.
  //Qué es eso de andar creando directorios y que se yo.
  if NewDir <> '' then begin
    //CreateDir(ExtractFilePath(FileName)+NewDir);
    NewDir:=NewDir+'\';
  end;
  GetGroupFileName:=
    ExtractFilePath(FileName)+NewDir+Char1+ChangeFileExt(ExtractFileName(FileName), '.txt');
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
  rFile: TVocFile;
begin

  TypeofTest:=NoTest;
  Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
  try
    Dontusetimerwhenright1.Checked:=Ini.ReadBool( 'Options',
    'Do not use timer when right', True);
    Dontusetimerwhenright1.OnClick(nil);
    Pausewhenright1.Checked:=Ini.ReadBool( 'Options',
    'Wait for click when right', False);
    Pausewhenright1.OnClick(nil);
    Pausewhenwrong1.Checked:=Ini.ReadBool( 'Options',
    'Wait for click when wrong', True);
    Pausewhenwrong1.OnClick(nil);

    RetestMistakes1.Checked:=Ini.ReadBool('Options', 'Retest mistakes', True);
    sbRetestMistakes.Down:=Ini.ReadBool('Options', 'Retest mistakes', True);
    ConstRetestEvery:=Ini.Readinteger('Options', 'Retest every', 4);
    ToRetestLimit:=Ini.ReadInteger('Options', 'Max to retest', 9);
    sbRetestNine.Down:=Ini.ReadBool('Options', 'Retest limited', true);

    Logtofile1.Checked:= Ini.ReadBool( 'Options', 'Log to file', True);

   {
    //Configuration form data
    ConfigForm.chkDelListFiles1.Checked:=Ini.ReadBool('Options', 'Delete list files when .goi is created', True);
     }
  finally
    Ini.Free;
  end;

  lAverage:=0;

  if FileExists(AppPath+ResultsFilename) then begin
    AssignFile(rFile, AppPath+ResultsFilename);
    Reset(rFile);
    NumResultsStored:=Filesize(rFile);
    Closefile(rFile);
  end else NumResultsStored:=0;

  if FileExists(AppPath+WrongsFilename) then begin
    AssignFile(rFile, AppPath+WrongsFilename);
    Reset(rFile);
    NumWrongsStored:=Filesize(rFile);
    Closefile(rFile);
  end else NumWrongsStored:=0;

end;

procedure TForm1.sbTestsClick(Sender: TObject);
begin
  fmJoinfiles.ShowModal;
end;

procedure TForm1.sbTextClick(Sender: TObject);
var
  fName: string;
begin
  if Fileopened.Name='' then fName:=AppPath+(LogFile1)
    else fName:=GetLFilename(Fileopened.Name);

  if not FileExists(fName) then ShowMessage('Nothing logged yet!') else
  begin
    fmText.RichEdit1.Clear;
    fmText.RichEdit1.Lines.LoadFromFile(fName);
    if fName<>AppPath+(LogFile1) then begin
    FormatText('[', 26, clBlue, 0, 0, -1);
    FormatText('Average', 13, clPurple, 3, 0, -1);
    FormatText('Correct!', 8, clGreen, 1, 0, -1);
    FormatText('Wrong!', 6, clRed, 1, 0, -1);
    FormatText('<->', 3, clCream, 1, 0, -1);
    end;
  fmText.RichEdit1.Color:=clSilver;
  fmText.RichEdit1.SelStart:=0;
  fmText.RichEdit1.SelLength:=0;
  fmText.ShowWindow(fName);
  //fmText.RichEdit1.Lines.LoadFromFile(fName, TEncoding.Unicode);
  end;
end;

//findtext('+',

procedure TForm1.FormatText(ToFind: string; Count: integer; Color: TColor; Style, Limit1, Limit2: integer);
var
  Pos, Pos1, Pos2: integer;
begin
  if Limit2=-1 then Limit2:=Length(fmText.RichEdit1.Text);
  Pos:=fmText.RichEdit1.FindText(ToFind, Limit1, Limit2, [stMatchCase]);
  Pos1:=Pos;
  while Pos<>-1 do begin
    fmText.RichEdit1.SelStart:=Pos;
    fmText.RichEdit1.SelLength:=Count;
    fmText.RichEdit1.SelAttributes.Color:=Color;
    if Style=1 then fmText.RichEdit1.SelAttributes.Style:=[fsBold];
    if Style=2 then fmText.RichEdit1.SelAttributes.Style:=[fsItalic];
    if Style=3 then fmText.RichEdit1.SelAttributes.Style:=[fsUnderline];
    Pos:=fmText.RichEdit1.FindText(ToFind, Pos+Count, Limit2, [stMatchCase]);
    Pos2:=Pos;
    //Limit2:=Pos1-(Pos+Count);
  end;
end;

procedure TForm1.sbLastTestedClick(Sender: TObject);
begin
  ShowStoredFiles(ResultsFilename, 'No tested files found!', '11');
end;

procedure TForm1.sbWrongSavedClick(Sender: TObject);
begin
  fmTestedFiles.ImageList1.Move(4, 0);
  fmTestedFiles.ImageList1.Move(1, 4);
  ShowStoredFiles(WrongsFilename, 'No wrong answers files found!','21');
  fmTestedFiles.ImageList1.Move(0, 4);
  fmTestedFiles.ImageList1.Move(3, 0);
end;

procedure TForm1.ShowStoredFiles(Filename, Text, Flags: string);
var
  RegFile: TVocFile;
  GoiFile: textfile;
  Reg: TVocReg;
  ListItem: TListItem;
  ArrayLength, i, ArchiveAverage: integer;
  gfLine: string;

begin
  fmTestedFiles.ListView1.Clear;
  AssignFile(RegFile, AppPath+Filename);
  TotalWordsInArchive:=0;
  ArchiveAverage:=0;

  if not FileExists(AppPath+Filename) then
    ShowMessage(Text) else
    begin
    Reset(RegFile);
    ArrayLength:=FileSize(RegFile);
    SetLength(FilenamesList, ArrayLength);
    while not eof(RegFile) do begin
      Read(RegFile, Reg);
      if Reg.Active=True then begin
      ListItem:=fmTestedFiles.ListView1.Items.Add;
      ListItem.Caption:=Reg.Description;
      ListItem.SubItems.Add(Inttostr(Reg.Average)+'%');
      ListItem.SubItems.Add(Reg.Date);
      //////----ARREGLAR ESTO DE FILENAMESLIST!!!----//////
      FilenamesList[FilePos(RegFile)-1]:=Reg.Filename;
      //Abre el archivo .goi para ver cuantas palabras tiene
      if Flags[1]='1' then begin
        AssignFile(Goifile, Reg.Filename);
        Reset(Goifile);
        for i:=0 to 6 do Readln(Goifile, gfLine);
        if gfLine<>'' then
          TotalWordsInArchive:=TotalWordsInArchive+Strtoint(gfLine)
        else
          TotalWordsInArchive:=0;
        CloseFile(Goifile);
        ArchiveAverage:=ArchiveAverage+Reg.Average;
      end;
      end;
    end;
    CloseFile(RegFile);
    if fmTestedFiles.ListView1.Items.Count <>0 then
      ArchiveAverage:=ArchiveAverage div fmTestedFiles.ListView1.Items.Count
      else ArchiveAverage:=0;

    fmTestedFiles.lbAverages.Caption:=Inttostr(ArchiveAverage);
    //Tag=1--> Stored file
    //Tag=2--> Wrong answers file
    if Flags[1]='1' then fmTestedFiles.SummaryPanel.Visible:=true
      else fmTestedFiles.SummaryPanel.Visible:=false;

    fmTestedFiles.Tag:=Strtoint(Flags[1]);
    if Flags[2]='1' then fmTestedFiles.Showmodal;

    //Se fija de donde se cargó la lista de vocabulario
    if Filename=ResultsFilename then Fileopened.WhereFrom:=wfStored
    else if Filename=WrongsFilename then Fileopened.WhereFrom:=wfWrongAnswers
    else Fileopened.WhereFrom:=wfNewlyCreated;
    end;
end;


function TForm1.GetAverage: integer;
var
  lName, fLine, lLine: string;
  lFile, File1: TextFile;
  AverageTemp: string;
begin
  if FileExists(Fileopened.Name) then begin
    AssignFile(File1, Fileopened.Name);
    Reset(File1);
    Readln(File1, fLine);
    Readln(File1, fLine);
    Readln(File1, fLine);
    Readln(File1, fLine);
    Readln(File1, fLine);
    Readln(File1, fLine);
    lName:=fLine;
    Closefile(File1);
    AssignFile(lFile, lName);

    if not FileExists(lName) then begin
      GetAverage:=0;
      exit;
    end else begin
      Reset(lFile);
      while not eof(lFile) do
      begin
        Readln(lFile, fLine);
        if Copy(fLine, 1, 4)=' -->' then lLine:=fLine;
      end;
      AverageTemp:=Copy(lLine, 44, 13);
      while RightStr(AverageTemp, 1)='%' do
        AverageTemp:=Copy(AverageTemp, 1, Length(AverageTemp)-1);

      try
        GetAverage:=Strtoint(AverageTemp);
      except
        on E: EConvertError do GetAverage:=0;
      end;

      //GetAverage:=Strtoint(AverageTemp);
      CloseFile(lFile);
    end;
  end else GetAverage:=0;//if FileExists(Fileopened.Name) then begin
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  UpdateCaptionButtons('0');
end;

procedure TForm1.Showselecteditemspanel1Click(Sender: TObject);
begin
  PanelSelectedItems.Visible:=Showselecteditemspanel1.Checked;
end;

procedure TForm1.Showlists1Click(Sender: TObject);
begin
  ListsPanel.Visible:=Showlists1.Checked;
  //if ListsPanel.Visible then height:=160 else height:=527;
end;


procedure TForm1.sbLoadOneByOneClick(Sender: TObject);
begin
  OpenDialog1.Filter:='Shift-Jis text files (*.txt)';
  OpenDialog2.Filter:='Shift-Jis text files (*.txt)';
  OpenDialog3.Filter:='Shift-Jis text files (*.txt)';
  OpenDialog4.Filter:='Shift-Jis text files (*.txt)';
  MenuLoad1.Popup(sbLoadOneByOne.Left+Left+65, sbLoadOneByOne.Top+Top+65);
end;

procedure TForm1.Loadkanjilist1Click(Sender: TObject);
begin
  if opendialog1.execute then begin
    listbox1.items.loadfromfile(opendialog1.filename);
    Loadkanjilist1.Checked:=True;
    CheckIfAllLoaded;
  end;
end;

procedure TForm1.LoadMeaningslist1Click(Sender: TObject);
begin
  if opendialog2.execute then begin
    listbox2.items.loadfromfile(opendialog2.filename);
    LoadMeaningslist1.Checked:=True;
    CheckIfAllLoaded;
  end;
end;

procedure TForm1.LoadKanareadings1Click(Sender: TObject);
begin
  if opendialog3.execute then begin
    listbox3.items.loadfromfile(opendialog3.filename);
    LoadKanareadings1.Checked:=True;
    CheckIfAllLoaded;
  end;
end;

procedure TForm1.LoadRomajireadings1Click(Sender: TObject);
begin
  if opendialog4.execute then begin
    listbox4.items.loadfromfile(opendialog4.filename);
    LoadRomajireadings1.Checked:=True;
    CheckIfAllLoaded;
  end;
end;

procedure TForm1.CheckIfAllLoaded;
var
  Description: string;
begin
  if (opendialog1.filename<>'')
  and(opendialog2.filename<>'')
  and(opendialog3.filename<>'')
  and(opendialog4.filename<>'')
  then begin
    sbSaveGroup.Enabled:=true;
    sbStore1.Enabled:=True;

    if Savedialog1.Execute then begin
      Description:=fmDescription.ShowWindow('Write a description for the test: ',
      FilenameWoPathAndExt(Savedialog1.FileName), '0');

      SaveGoiFile(Opendialog1.FileName, Opendialog2.FileName, Opendialog3.FileName,
        Opendialog4.FileName, '', Savedialog1.FileName, '02', Description);
      Fileopened.Name:=Savedialog1.FileName;
      Fileopened.Description:=Description;
      Fileopened.WhereFrom:=wfNewlyCreated;
      LoadGoiFile(Fileopened.Name);
      fmResults.StoreFile(ResultsFilename,Savedialog1.FileName,Description,0);

      //Mezcla las listas
      form1.btMixLists.Click;
    end;//if Savedialog1.Execute then begin
  end;//if (opendialogX.filename<>'')
end;


procedure TForm1.Generatewronganswersreport1Click(Sender: TObject);
begin
  if Savedialog1.Execute then
    Generatewronganswersreport(AppPath+Unit1.LogFile1, Savedialog1.Filename);
end;

procedure TForm1.Generatewronganswersreport(Filename1, ReportName: string);
var
  File1, File2, File3: TextFile;
  fLine, pLine, kReportName, rReportName: unicodestring;
  i: integer;
begin
  kReportName:=ExtractFilePath(ReportName)+'k'+ChangefileExt(ExtractFilename(ReportName), '.txt');
  rReportName:=ExtractFilePath(ReportName)+'r'+ChangefileExt(ExtractFilename(ReportName), '.txt');
  ReportName:=ChangeFileExt(ReportName, '.txt');
  Assignfile(File1, Filename1);  //LogFile1
  Assignfile(File2, ReportName);    //The file with the kanjis and readings
  Assignfile(File3, kReportName); //Only the kanjis
  Reset(File1);
  Rewrite(File2);
  Writeln(File2, '----------------- Wrong answers report -----------------');
  Writeln(File2, '');
  Rewrite(File3);
  while not eof(File1) do begin
    Readln(File1, fLine);
      for i:=0 to Length(fLine)-Length('Wrong!') do begin
        pLine:=Copy(fLine, i, Length('Wrong!'));
        if pLine='Wrong!' then begin
          Writeln(File2, fLine);
          Writeln(File3, Copy(fLine, 5, 2));
        end;
      end;
  end;
  Writeln(File2, '');
  Writeln(File2, '----------------- Wrong answers report -----------------');
  Writeln(File2, '');
  Closefile(File1);
  Closefile(File2);
  Closefile(File3);
  fmResults.CreateReadingsFile(0, kReportName, rReportName);
  Form1.SaveGoiFile(kReportName, kReportName, kReportName, rReportName, ReportName, Savedialog1.Filename, '12', '');
end;

procedure TForm1.Show1write2Click(Sender: TObject);
begin
  LogToFile(Form1.Logginglist1, '"Show list 1, ask for list 2" test started...', '1110');
  form1.WindowState:=wsminimized;
  Fileopened.CurrentTypeofTest:=Kanjitomeaning;
  TestingForm.ShowWindow(KanjiToMeaning, 'Write the meaning of the word', 'Show info');
end;

procedure TForm1.Show1write4Click(Sender: TObject);
var
  tempTypeofTest: TTypeoftest;
begin
  LogToFile(Form1.Logginglist1, '"Show list 1, ask for list 4" test started...', '1110');
  form1.WindowState:=wsminimized;
  if Typeoftest<>Kanatest then tempTypeoftest:=KanjiToReading
    else tempTypeoftest:=Kanatest;
  Fileopened.CurrentTypeofTest:=tempTypeoftest;
  TestingForm.ShowWindow(tempTypeofTest, 'Write the reading of the word', 'Show meaning');
end;

procedure TForm1.Show2write4Click(Sender: TObject);
begin
  LogToFile(Form1.Logginglist1, '"Show list 2, ask for list 4" test started...', '1110');
  form1.WindowState:=wsminimized;
  Fileopened.CurrentTypeofTest:=Meaningtoromaji;
  TestingForm.ShowWindow(Meaningtoromaji, 'Write the trasliteration for the meaning of the word', '');
end;

procedure TForm1.OnoffTestbuttons(Value: boolean);
begin
  sbKanjitomeaning.Enabled:=Value;
  sbKanjitoreading.Enabled:=Value;
  sbMeaningtokanji.Enabled:=Value;
  sbMeaningtoreading.Enabled:=Value;
  sbReadingtokanji.Enabled:=Value;
  sbReadingtomeaning.Enabled:=Value;
  sbShow1Askfor3.Enabled:=Value;
  sbShow2Askfor3.Enabled:=Value;
  sbShow3Askfor4.Enabled:=Value;
end;

procedure TForm1.Show3write2Click(Sender: TObject);
begin
  LogToFile(Form1.Logginglist1, '"Show list 3, ask for list 2" test started...', '1110');
  form1.WindowState:=wsminimized;
  Fileopened.CurrentTypeofTest:=Readingtomeaning;
  TestingForm.ShowWindow(ReadingToMeaning, 'Write the meaning for the word whose info is shown', 'Show kanji');
end;

procedure TForm1.sbMeaningtokanjiClick(Sender: TObject);
begin
  TypeofTest:=MeaningToKanji;
  MenuTokanjiTesttype.Popup(sbMeaningtokanji.Left+Left+65, sbMeaningtokanji.Top+Top+65);
  //fmToKanji.Showmodal;
end;

procedure TForm1.sbReadingtokanjiClick(Sender: TObject);
begin
  Typeoftest:=ReadingtoKanji;
  MenuTokanjiTesttype.Popup(sbReadingtokanji.Left+Left+65, sbReadingtokanji.Top+Top+65);
  //fmToKanji.Showmodal;
end;

procedure TForm1.sbRetestMistakesClick(Sender: TObject);
begin
  Retestmistakes1.Checked:=sbRetestmistakes.down;
end;

procedure TForm1.Retestmistakes1Click(Sender: TObject);
begin
  ToRetest.Count:=0;
  ToRetest.Index:=0;
  ToRetest.Corrected:=0;
  sbRetestmistakes.down:=Retestmistakes1.Checked;
end;

function TForm1.GetLFilename(Fileopened: string): string;
var
  File1: TextFile;
  fLine: unicodestring;
begin
  AssignFile(File1, Fileopened);
  Reset(File1);
  Readln(File1, fLine);
  Readln(File1, fLine);
  Readln(File1, fLine);
  Readln(File1, fLine);
  Readln(File1, fLine);
  Readln(File1, fLine);
  GetLFilename:=fLine;
  Closefile(File1);
end;

procedure TForm1.Drawthekanji1Click(Sender: TObject);
begin
  LogToFile(Form1.Logginglist1, 'Drawing test started...', '1110');
  form1.WindowState:=wsminimized;
  fmToKanji.Showmodal;
end;

procedure TForm1.Multiplechoice1Click(Sender: TObject);
begin
  LogToFile(Form1.Logginglist1, 'Multiple choice test started...', '1110');
  form1.WindowState:=wsminimized;
  fmMultipleChoice.Showmodal;
end;

procedure TForm1.Retestevery1Click(Sender: TObject);
begin
  ConfigForm.ShowModal;
end;

procedure TForm1.Helptopics1Click(Sender: TObject);
begin
  //WinExec('c:\goi32\Help\Goi.htm', SW_SHOWNORMAL);
  ShellExecute(0, nil, 'c:\goi32\Help\Goi.htm',
    nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Pausewhenright1Click(Sender: TObject);
begin
  if Pausewhenright1.Checked=True then Pausewhenright1.ImageIndex:=2
    else Pausewhenright1.ImageIndex:=8;
end;

procedure TForm1.Pausewhenwrong1Click(Sender: TObject);
begin
  if Pausewhenwrong1.Checked=True then Pausewhenwrong1.ImageIndex:=3
    else Pausewhenwrong1.ImageIndex:=9;
end;

procedure TForm1.Dontusetimerwhenright1Click(Sender: TObject);
begin
  if Dontusetimerwhenright1.Checked=True then Dontusetimerwhenright1.ImageIndex:=5
    else Dontusetimerwhenright1.ImageIndex:=7;
end;

procedure TForm1.Register1Click(Sender: TObject);
begin
  fmRegistration.ShowModal;
end;

procedure TForm1.Font1Click(Sender: TObject);
begin
  if Fontdialog1.Execute then (Sender as TPanel).Font.Size:=Fontdialog1.Font.Size;
end;

end.
