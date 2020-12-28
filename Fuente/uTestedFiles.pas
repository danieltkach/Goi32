unit uTestedFiles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, ImgList, Unit1, CheckLst;

type
  TfmTestedFiles = class(TForm)
    Bevel1: TBevel;
    ListView1: TListView;
    btLoad: TBitBtn;
    btClose: TBitBtn;
    ImageList1: TImageList;
    btClear: TBitBtn;
    btClean: TBitBtn;
    btDelete: TBitBtn;
    Panel1: TPanel;
    Edit1: TEdit;
    Button1: TButton;
    Button3: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Button4: TButton;
    Button2: TButton;
    BitBtn1: TBitBtn;
    Edit6: TEdit;
    Bevel2: TBevel;
    BitBtn2: TBitBtn;
    btDetails: TBitBtn;
    btJoin: TBitBtn;
    ProgressBar1: TProgressBar;
    SaveDialog1: TSaveDialog;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    tempListbox: TCheckListBox;
    Listbox1: TCheckListBox;
    Listbox2: TCheckListBox;
    Listbox3: TCheckListBox;
    Listbox4: TCheckListBox;
    SummaryPanel: TPanel;
    lbWords1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    lbAverages: TLabel;
    procedure ListView1ColumnClick(Sender: TObject; Column: TListColumn);
    procedure ListView1Compare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ListView1Click(Sender: TObject);
    procedure btLoadClick(Sender: TObject);
    procedure btClearClick(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure ListView1Change(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure btCleanClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btDetailsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btJoinClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure DeleteRegister(Filename1: string; RegNumber: integer);
    procedure EditRegFile(Filename1: string; Sender: TObject);
    procedure DeleteNonActiveRegs(Filename1: string);

    { Public declarations }
  end;

  TLoadedType=(Tested, WrongAnswer);

var
  fmTestedFiles: TfmTestedFiles;
  ColumnToSort: Integer;
  LoadedReg: TVocReg;
  StoredlistIndex, WrongslistIndex: integer;


implementation

uses uText, StrUtils, uJoinFiles, uDescription;

var
  File1: Unit1.TVocFile;
  Reg: TVocReg;

{$R *.dfm}

procedure TfmTestedFiles.ListView1ColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  ColumnToSort:=Column.Index;
  (Sender as TCustomListView).AlphaSort;
end;

procedure TfmTestedFiles.ListView1Compare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
var
  ix: Integer;
begin
  if ColumnToSort = 0 then
    Compare := CompareText(Item1.Caption,Item2.Caption)
  else begin
    ix := ColumnToSort - 1;
    Compare := CompareText(Item1.SubItems[ix],Item2.SubItems[ix]);
  end;
end;

procedure TfmTestedFiles.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Listview1.Clear;
  btLoad.Enabled:=False;
  btDelete.Enabled:=False;
  btDetails.Enabled:=False;
  btJoin.Enabled:=False;
  Listview1.Checkboxes:=False;
  ProgressBar1.Visible:=False;
end;

procedure TfmTestedFiles.ListView1SelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  if Listview1.itemindex <>-1 then //CHANGE THIS FOR "REGINDEX <>-1"
    Caption:=Unit1.FilenamesList[Listview1.itemindex]
  else
    Caption:='No file selected';
end;

procedure TfmTestedFiles.ListView1Click(Sender: TObject);
var
  i, CheckedCount: integer;
  //CheckedList: array of string;
begin
  if Listview1.ItemIndex <>-1
  then begin
    btLoad.Enabled:=True;
    btDelete.Enabled:=True;
    btDetails.Enabled:=True;
  end else begin
    btLoad.Enabled:=False;
    btDelete.Enabled:=False;
    btDetails.Enabled:=False;
  end;
  //Regindex:=Listview1.ItemIndex;
  CheckedCount:=0;
  for i:=0 to Listview1.Items.Count-1 do
    if Listview1.Items.Item[i].Checked then begin
      inc(CheckedCount);
      //CheckedList[i]:=FilesnamesList[i];
    end;
  if CheckedCount>1 then btJoin.Enabled:=True else btJoin.Enabled:=False;

  if Tag=1 then begin
    StoredlistIndex:=Listview1.ItemIndex;
    WrongslistIndex:=-1;
  end else begin
    WrongslistIndex:=Listview1.ItemIndex;
    StoredlistIndex:=-1;
  end;

end;

procedure TfmTestedFiles.btLoadClick(Sender: TObject);
var
  AverageTemp: string;
  LoadResult: boolean;
begin
  if ExtractFileExt(Caption)='.goi' then begin
    LoadResult:=Form1.LoadGoiFile(Caption);
  end
  else LoadResult:=False;

  if LoadResult then begin
  with LoadedReg do begin
    if Tag=1 then Filename:=FilenamesList[StoredlistIndex]
    else Filename:=FilenamesList[WrongslistIndex];
    Description:=Listview1.Selected.Caption;
    AverageTemp:=Listview1.Selected.SubItems.Strings[0];
    while RightStr(AverageTemp, 1)='%' do
        AverageTemp:=Copy(AverageTemp, 1, Length(AverageTemp)-1);
    Average:=Strtoint(AverageTemp);
    Date:=Listview1.Selected.SubItems.Strings[1];
    Active:=True;
  end;

  Fileopened.Description:=LoadedReg.Description;
  Fileopened.CurrentAverage:=LoadedReg.Average;

  if Tag=1 then begin
    StoredlistIndex:=Listview1.ItemIndex;
    Fileopened.WhereFrom:=wfWrongAnswers
  end else
  if Tag=2 then begin
    WrongslistIndex:=Listview1.ItemIndex;
    Fileopened.WhereFrom:=wfStored;
  end;

  lAverage:=LoadedReg.Average;
  lAverage:=Fileopened.CurrentAverage;
  Form1.UpdateCaptionButtons('1');
  Form1.sbLastTested.Enabled:=False;
  Form1.sbWrongSaved.Enabled:=False;
  Close; //if LoadResult then begin
  end;

  //Mezcla las listas
  form1.btMixLists.Click;
end;

procedure TfmTestedFiles.btClearClick(Sender: TObject);
begin
  if MessageDlg('Do you want to delete the file?', mtWarning,
    mbOkCancel, 0) = mrOk then begin
    if Tag=1 then DeleteFile(AppPath+ResultsFilename);
    if Tag=2 then DeleteFile(AppPath+WrongsFilename);
    Listview1.Clear;
    Unit1.FilenamesList:=nil;
    btClear.Enabled:=False;
    ShowMessage('The wrong answers files will not be removed. You must do it manually');
  end;//if MessageDlg...
end;

procedure TfmTestedFiles.btDeleteClick(Sender: TObject);
var
  AssociatedFile: string;
    procedure DeleteAssociatedFile(AssociatedFile: string);
  var
    GoiFile: TextFile;
    fLine: string;
    g: integer;
  begin
  if MessageDlg('Do you want to delete the file associated to this item as well?'+#13+
  AssociatedFile, mtWarning, mbOkCancel, 0) = mrOk
  then begin
    AssignFile(GoiFile, AssociatedFile);
    Reset(GoiFile);
    Readln(GoiFile, fLine);
    //1- Read goi file and delete all the files it has.
    for g:=1 to 5 do begin
      Readln(GoiFile, fLine);
      if FileExists(fLine) then DeleteFile(fLine);
    end;
    //2- Delete the folder and the goi file.
    RemoveDir(ExtractFilePath(fLine));
    Closefile(GoiFile);
    Deletefile(AssociatedFile);
  end;
  end;

begin
  if MessageDlg('Do you want to delete the selected item?', mtWarning,
    mbOkCancel, 0) = mrOk then begin
    Index:=Listview1.ItemIndex;
    AssociatedFile:=Caption;
    Listview1.Items.Delete(Listview1.ItemIndex);
    if Tag=1 then begin
      DeleteRegister(AppPath+ResultsFilename, Index);
      DeleteAssociatedFile(AssociatedFile);
      Form1.Showstoredfiles(ResultsFilename, 'List update message', '10');
    end;
    if Tag=2 then begin
      DeleteRegister(AppPath+WrongsFilename, Index);
      DeleteAssociatedFile(AssociatedFile);
      Form1.Showstoredfiles(WrongsFilename, 'List update message', '20');
    end;

  btDelete.Enabled:=False;
  btDetails.Enabled:=False;

end;//if MessageDlg...
  Listview1.Update;
end;


procedure TfmTestedFiles.DeleteRegister(Filename1: string; RegNumber: integer);
var
  File1, TempFile: TVocFile;
  Reg: TVocReg;
  TempFilename: string;
begin
  TempFilename:=AppPath+'TempFile';
  AssignFile(File1, Filename1);
  AssignFile(TempFile, TempFilename);
  Reset(File1);
  Seek(File1, RegNumber);
  Read(File1, Reg);
  Reg.Active:=False;
  Seek(File1, FilePos(File1)-1);
  Write(File1, Reg);
  Reset(File1);
  Rewrite(TempFile);
  while not eof(File1) do begin
    Read(File1, Reg);
    if Reg.Active then Write(Tempfile, Reg);
  end;
  CloseFile(File1);
  CloseFile(TempFile);
  Deletefile(Filename1);
  Renamefile(TempFilename, Filename1);
end;

procedure TfmTestedFiles.DeleteNonActiveRegs(Filename1: string);
var
  File1, TempFile: TVocFile;
  Reg: TVocReg;
  TempFilename: string;
begin
  TempFilename:=AppPath+'TempFile';
  AssignFile(File1, Filename1);
  AssignFile(TempFile, TempFilename);
  Reset(File1);
  Rewrite(TempFile);
  while not eof(File1) do begin
    Read(File1, Reg);
    if Reg.Active then Write(Tempfile, Reg);
  end;
  CloseFile(File1);
  CloseFile(TempFile);
  Deletefile(Filename1);
  Renamefile(TempFilename, Filename1);
end;

procedure TfmTestedFiles.EditRegFile(Filename1: string; Sender: TObject);
begin
  AssignFile(File1, Filename1);
  Reset(File1);
  Button3Click(Sender);
end;

procedure TfmTestedFiles.ListView1Change(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  if Listview1.Items.Count >0 then begin
    btClear.Enabled:=True;
    btClean.Enabled:=True;
  end else begin
    btClear.Enabled:=True;
    btClean.Enabled:=True;
  end;
end;

procedure TfmTestedFiles.btCleanClick(Sender: TObject);
var
  i: integer;
  //TempList: TStringArray;
begin
  for i:=0 to Listview1.Items.Count do begin
    //
  end;
end;

procedure TfmTestedFiles.Button3Click(Sender: TObject);
begin
  Read(File1, Reg);
  Edit2.Text:=Reg.Filename;
  Edit3.Text:=Reg.Description;
  Edit4.Text:=Inttostr(Reg.Average);
  Edit5.Text:=Reg.Date;
  if Reg.Active then Edit6.Text:='True' else Edit6.Text:='False';
  //if eof(File1) then button3.Enabled:=False;
end;

procedure TfmTestedFiles.Button1Click(Sender: TObject);
begin
  EditRegFile(Edit1.Text, Sender);
end;

procedure TfmTestedFiles.Button2Click(Sender: TObject);
begin
  Seek(File1, Filepos(file1)-1);
  with reg do begin
    Filename:=Edit2.Text;
    Description:=Edit3.Text;
    Average:=Strtoint(Edit4.Text);
    Date:=Edit5.Text;
    if Edit6.Text='True' then Active:=True else Active:=False;
  end;
  Write(File1, Reg);
end;

procedure TfmTestedFiles.Button4Click(Sender: TObject);
begin
  Closefile(File1);
end;

procedure TfmTestedFiles.BitBtn1Click(Sender: TObject);
begin
  Panel1.Visible:=not Panel1.Visible;
end;

procedure TfmTestedFiles.BitBtn2Click(Sender: TObject);
begin
  DeleteNonActiveRegs(Edit1.Text);
end;

procedure TfmTestedFiles.BitBtn3Click(Sender: TObject);
begin
  edit1.Text:='C:\Goi32\Results.g32';
  Editregfile(Edit1.Text, Sender);
end;

procedure TfmTestedFiles.BitBtn4Click(Sender: TObject);
begin
  edit1.Text:='C:\Goi32\WrongAns.g32';
  Editregfile(Edit1.Text, Sender);
end;

procedure TfmTestedFiles.FormShow(Sender: TObject);
begin
  if Listview1.Items.Count >0 then begin
    btClear.Enabled:=True;
    btClean.Enabled:=True;
  end else begin
    btClear.Enabled:=False;
    btClean.Enabled:=False;
  end;

  if Fileopened.Name='' then begin
    StoredlistIndex:=-1; WrongslistIndex:=-1;
  end;

  if Tag=2 then begin
    fmTestedFiles.Listview1.Checkboxes:=True;
    btJoin.Visible:=True
  end else begin
    fmTestedFiles.Listview1.Checkboxes:=False;
    btJoin.Visible:=False;
    lbWords1.Caption:=Inttostr(TotalWordsInArchive);
  end;

end;

procedure TfmTestedFiles.btDetailsClick(Sender: TObject);
var
  //Pos, Limit1, Limit2: integer;
  fName: string;
begin
  fName:=Form1.GetLFilename(FilenamesList[Listview1.Itemindex]);
  if Fileexists(fName) then begin
  fmText.RichEdit1.Clear;
  fmText.RichEdit1.Lines.LoadFromFile(fName);

    with Form1 do begin
    FormatText('[', 26, clBlue, 0, 0, -1);
    FormatText('Average', 13, clPurple, 3, 0, -1);
    FormatText('Correct!', 8, clGreen, 1, 0, -1);
    FormatText('Wrong!', 6, clRed, 1, 0, -1);
    FormatText('<->', 3, clCream, 1, 0, -1);
    fmText.RichEdit1.Color:=clSilver;
    end;
    fmText.RichEdit1.SelStart:=0;
    fmText.RichEdit1.SelLength:=0;
    fmText.ShowWindow(fName);
  end else Showmessage('No details yet!');
end;

procedure TfmTestedFiles.FormCreate(Sender: TObject);
begin
  if Fileopened.Name='' then begin
    StoredlistIndex:=-1;
    WrongslistIndex:=-1;
  end;
end;



procedure TfmTestedFiles.btJoinClick(Sender: TObject);
var
  i, ckf: integer;
  CheckedFiles: array of TGoiFile;
  tempGoifile: array of TextFile;
  //tempGoifile: array of TGoiFile;
  Description, tfLine: string;
begin
  if Savedialog1.Execute then begin

  Description:=fmDescription.ShowWindow('Write a description for the test: ',
    Form1.FilenameWoPathAndExt(Savedialog1.FileName), '0');

  ckf:=0;
  for i:=0 to Listview1.Items.Count-1 do begin
    if Listview1.Items[i].Checked then inc(ckf);
  end;
  SetLength(CheckedFiles, ckf);

  ckf:=0;
  for i:=0 to Listview1.Items.Count-1 do begin
    if Listview1.Items[i].Checked then begin
      CheckedFiles[ckf].Name:=FilenamesList[i];
      inc(ckf);
    end;
  end;
  SetLength(tempGoifile, ckf);

  for i:=0 to ckf-1 do begin
    Assignfile(tempGoifile[i], CheckedFiles[i].Name);
    Reset(tempGoifile[i]);

    Readln(tempGoifile[i], tfLine);
    CheckedFiles[i].Description:=tfLine;

    Readln(tempGoifile[i], tfLine);
    CheckedFiles[i].Files[1]:=tfLine;
    Readln(tempGoifile[i], tfLine);
    CheckedFiles[i].Files[2]:=tfLine;
    Readln(tempGoifile[i], tfLine);
    CheckedFiles[i].Files[3]:=tfLine;
    Readln(tempGoifile[i], tfLine);
    CheckedFiles[i].Files[4]:=tfLine;
    Readln(tempGoifile[i], tfLine);
    CheckedFiles[i].Files[5]:=tfLine;
    Closefile(tempGoifile[i]);
  end;

  //if ShowMessage('Delete selected items?') then begin end;


  fmJoinFiles.JoinGoifiles(CheckedFiles, Savedialog1.FileName, Description, false);

  end;//if Savedialog1.Execute then begin

end;

end.
