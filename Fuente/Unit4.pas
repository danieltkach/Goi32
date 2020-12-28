unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, IniFiles, CheckLst;

type
  TfmResults = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    label4: TLabel;
    Bevel3: TBevel;
    sbWrongAnswers: TSpeedButton;
    sbRightAnswers: TSpeedButton;
    SaveDialog1: TSaveDialog;
    ListBox1: TCheckListBox;
    ListBox2: TCheckListBox;
    MainwordsListbox: TCheckListBox;
    ErrorsListbox2: TCheckListBox;
    ErrorsListbox3: TCheckListBox;
    ErrorsListbox4: TCheckListBox;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbWrongAnswersClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SaveWrongAnswersFile(Indexes: array of integer; Description: string);
    procedure CreateReadingsFile(Flag: integer; Filename1, Filename2: string);
    procedure StoreFile(FileWhere, FileWhat, fDescription: string; fAverage: integer);
    function GetWrongAnswersFilename(Filename: string): string;
  end;



var
  fmResults: TfmResults;

implementation
uses
unit1, uTesting1, uJoinFiles, uDescription, uTestedFiles;
{$R *.DFM}

procedure TfmResults.FormShow(Sender: TObject);
var
  aa: integer;
  ErrorsFilename: string;

begin
  Savedialog1.InitialDir:=AppPath;
  listbox1.Items.Clear;
  listbox2.Items.Clear;
  MainwordsListbox.Clear;
  ErrorsListbox2.Clear;
  ErrorsListbox3.Clear;
  ErrorsListbox4.Clear;

  label4.caption:=inttostr((100*raCounter)div(raCounter+waCounter));

  if strtoint(label4.caption)<70 then label4.font.color:=clred else
  label4.font.color:=clgreen;
  if label4.caption='100' then label4.font.color:=clnavy;

  //Adds the answers to the list-boxes.
  for aa:=0 to raCounter-1 do listbox1.items.Add(righta[aa]);
  for aa:=0 to waCounter-1 do listbox2.items.Add(wronga[aa]);
  //Adds main list words correspongin to mistakes. These are the ones that have
  //to be saved to wrong answer files. This list is not visible.
  for aa:=0 to waCounter-1 do begin
    MainwordsListbox.Items.Add(lista11[wrongaindex[aa]]);
    ErrorsListbox2.Items.Add(lista22[wrongaindex[aa]]);
    ErrorsListbox3.Items.Add(lista33[wrongaindex[aa]]);
    ErrorsListbox4.Items.Add(lista44[wrongaindex[aa]]);
  end;

  fmResults.Caption:='Results -> '+'Right: '+IntToStr(ListBox1.Items.Count)+
  ' - Wrong: '+IntToStr(ListBox2.Items.Count);

  lAverage:=Strtoint(Label4.Caption);

  sbRightAnswers.Enabled:=raCounter<>0;
  sbWrongAnswers.Enabled:=waCounter<>0;

//Logging ----------------------------------------------------------------------
  Form1.LogToFile(Form1.Logginglist1,
  'Test completed successfully. Average: '+Label4.Caption+'%', '1111');
//^-//-^//^-//-^//^-//-^//--//--//--//--//--//--//--//--//--//--//--//--//--//--//--
//In this file I save all the results of the tests to show then in the
//last tested files window.

ErrorsFilename:=GetWrongAnswersFilename(Fileopened.Name);

  if (Fileopened.WhereFrom <> wfWrongAnswers) then begin
    Storefile(ResultsFilename, Fileopened.Name, Fileopened.Description, -1);
    if (wacounter <> 0) and (form1.sbAutosaveWronganswers.Down) then begin
      SaveWrongAnswersFile(uTesting1.wrongaindex, Fileopened.Description);
      Storefile(WrongsFilename, ErrorsFilename, Fileopened.Description, 0);
    end;
  end else
  begin
    StoreFile(WrongsFilename, Fileopened.Name, Fileopened.Description, -1);
  end;
end;

procedure TfmResults.StoreFile(FileWhere, FileWhat, fDescription: string; fAverage: integer);
var
  RegFile: TVocFile;
  Reg: TVocReg;
  i, NumStored: integer;
  Found: boolean;
begin
  Found:=False;
  if FileWhere = ResultsFilename then NumStored:=NumResultsStored;
  if FileWhere = WrongsFilename then NumStored:=NumWrongsStored;

  AssignFile(RegFile, AppPath+FileWhere);
  if FileExists(AppPath+FileWhere) then Reset(RegFile) else Rewrite(RegFile);

  i:=0;
  while not eof(Regfile) and (not Found) do begin
    Read(Regfile, Reg);
    if (Reg.Filename=FileWhat) then begin Seek(RegFile, i); Found:=True; end;
    inc(i);
  end;
  if (not Found) then Seek(RegFile, Filesize(RegFile));

  if FileWhere = ResultsFilename then inc(NumResultsStored);
  if FileWhere = WrongsFilename then inc(NumWrongsStored);

  with Reg do begin
    Filename:=FileWhat;
    Description:=fDescription;
    //if FileWhere=WrongsFilename then Average:=0 else Average:=lAverage;
    if fAverage<>-1 then Average:=fAverage else Average:=lAverage;
    Date:=DateTimeToStr(Now);
    Active:=True;
  end;
  Write(RegFile, Reg);
  CloseFile(RegFile);
end;

procedure TfmResults.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfmResults.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Fileopened.CurrentAverage:=Strtoint(label4.Caption);
  Form1.WindowState:=wsnormal;
  Label4.Caption:='0';
end;

//Flag 1 wrong answers -- Flag 2 right answers
//If I know the quantity of items in INDEXES, then I don't need the FLAG
//parameter.

function TfmResults.GetWrongAnswersFilename(Filename: string): string;
begin
  GetWrongAnswersFilename:=ExtractFilePath(Filename)+
  Form1.FilenameWoPathAndExt(Filename)
  +'\errors\err'+ExtractFilename(Filename);
end;

procedure TfmResults.SaveWrongAnswersFile(Indexes: array of integer; Description: string);
var
  GoiFilename, Filename1, Filename2, Filename3, Filename4, Filename5: string;
  File2, File3, File4, File5: TextFile;
  i, j: integer;
begin
  Savedialog1.FileName:=Description;

  GoiFilename:=Form1.GetGroupFileName(Description, 'err', 'err');
  Goifilename:=ChangeFileExt(ExtractFileName(Goifilename), '.goi');

  NewDir:=Extractfilepath(Fileopened.Name)
   +Form1.FilenameWoPathAndExt(ExtractFilename(Fileopened.Name))
   +'\errors';

  Filename1:=Form1.GetGroupFileName(GoiFilename, 'kw', '');
  //THIS WOULD BE THE PART OF GETRIGHTPATH------------------------
  Filename2:=Form1.GetGroupFileName(GoiFilename, 'm', '');  //
  Filename3:=Form1.GetGroupFileName(GoiFilename, 'r', '');  //
  Filename4:=Form1.GetGroupFileName(GoiFilename, 'rr', ''); //
  Filename5:=Form1.GetGroupFileName(GoiFilename, 'l', '');  //

  CreateDir(NewDir);
  ChDir(Newdir);
  AssignFile(File2, Filename2);
  AssignFile(File3, Filename3);
  AssignFile(File4, Filename4);
  AssignFile(File5, Filename5);
  Rewrite(File2);
  Rewrite(File3);
  Rewrite(File4);
  Rewrite(File5);

  CloseFile(File2);
  CloseFile(File3);
  CloseFile(File4);

  j:=Length(Indexes);
  i:=0;

  //listbox2.Items.SaveToFile(Filename1, TEncoding.Unicode);
  MainwordsListbox.Items.SaveToFile(Filename1, TEncoding.Unicode);
  ErrorsListbox2.Items.SaveToFile(Filename2, TEncoding.Unicode);
  ErrorsListbox3.Items.SaveToFile(Filename3, TEncoding.Unicode);
  ErrorsListbox4.Items.SaveToFile(Filename4, TEncoding.Unicode);
 {
  while i < j do begin
    //Writeln(File1, utf8tounicodestring(utf8encode(lista11[Indexes[i]])));
    //Writeln(File1, UnicodeTextLine);
    //Writeln(File2, lista22[Indexes[i]]);
    //Writeln(File3, lista33[Indexes[i]]);
    {
    Writeln(File2, utf8tounicodestring(utf8encode(lista22[Indexes[i]])));
    Writeln(File3, utf8tounicodestring(utf8encode(lista33[Indexes[i]])));
    Writeln(File4, lista44[Indexes[i]]);
    inc(i);
  end;
 }
  Writeln(File5, Description);
  Writeln(File5, '');
  Writeln(File5, '*********************************************');
  Writeln(File5, '* Created: '+Datetimetostr(Now)+'*');
  Writeln(File5, '*********************************************');
  Writeln(File5, '');
  Writeln(File5, 'Lines in this file: '+Inttostr(j));
  Writeln(File5,
  '________________________________________________');
  Writeln(File5, '');


  CloseFile(File5);

  //En vez de llammar SaveGoifile acá, puedo mejor poner los datos en la variable
  //global Fileopened, y luego llamar la función de otro lugar más adecuado... y
  //no así de forma anidada.
  Form1.SaveGoiFile(
    Filename1, Filename2, Filename3, Filename4, Filename5
    ,NewDir+'\'+GoifileName, '02', Description
  );
  Fileopened.WrongAnswersFilename[1]:=Goifilename;
end;

procedure TfmResults.sbWrongAnswersClick(Sender: TObject);
var
  Description: string;
begin
  if SaveDialog1.Execute then begin
  Description:=fmDescription.ShowWindow('Write a description for the test: ',
    Form1.FilenameWoPathAndExt(Savedialog1.FileName), '0');
  StoredlistIndex:=-1;
  WrongslistIndex:=-1;
  fmTestedfiles.ListView1.ItemIndex:=-1;
  SaveWrongAnswersFile(uTesting1.wrongaindex, Description);
  Storefile(WrongsFilename, ExpandFilename(Fileopened.WrongAnswersFilename[1]), Description, 0);
  end;
end;

procedure TfmResults.CreateReadingsFile(Flag: integer; Filename1, Filename2: string);
var
  File1, File2, File3: TextFile;
  Line1, Line2: string;
  Found: boolean;

begin
  if Flag=2 then ListBox1.Items.SaveToFile(FileName1, TEncoding.Unicode)
  else
  if Flag=1 then ListBox2.Items.SaveToFile(FileName1, TEncoding.Unicode);

     AssignFile(File1, FileName1);
     //AssignFile(File2, KanjiListFileName);
     AssignFile(File3, FileName2);
     Reset(File1);
     Reset(File2);
     Rewrite(File3);

     Found:=False;
     while not eof(File1) do
     begin
          Readln(File1, Line1);
          Reset(File2);
          while not Found and not eof(File2) do
          begin
               Readln(File2, Line2);
               if Copy(Line2, 1, 2)=Copy(Line1, 1, 2) then
                  begin
                  Writeln(File3, Copy(Line2,4,42));
                  Found:=True;
                  end;
          end;
          Found:=False;
     end;
     CloseFile(File1);
     CloseFile(File2);
     CloseFile(File3);
end;

end.
