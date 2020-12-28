unit uJoinFiles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, FileCtrl, Unit1, CheckLst;

type
  TfmJoinFiles = class(TForm)
    btRemove: TBitBtn;
    btAdd: TBitBtn;
    listFilestojoin: TListBox;
    FileListBox1: TFileListBox;
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    FilterComboBox1: TFilterComboBox;
    btAuto: TBitBtn;
    Bevel1: TBevel;
    edResultingName: TLabeledEdit;
    btSave: TBitBtn;
    btClose: TBitBtn;
    ProgressBar1: TProgressBar;
    edDescription: TLabeledEdit;
    BitBtn1: TBitBtn;
    UpDown1: TUpDown;
    edWordsNum: TEdit;
    procedure btAddClick(Sender: TObject);
    procedure btRemoveClick(Sender: TObject);
    procedure DirectoryListBox1Change(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btAutoClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure FileListBox1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    function GetFileHandle(Filename1: string): Cardinal;
    procedure JoinGoifiles(Goifiles: array of TGoifile; Newfilename, Description: string; EraseRandom: boolean);
    procedure CreateRandomVocabulary(Goifiles: array of TGoifile; Newfilename, Descritpion: string);
    { Public declarations }
  end;

var
  fmJoinFiles: TfmJoinFiles;
  TempGoiFile, ResultingFile, lResultingFile: TextFile;
  ResultingName, rResultingName, lResultingName: string;
  Index, Count: integer;
  TempName, tfLine, tGoiline: array[0..4]of string;
  TempFile: TextFile;
  TempGoiName, NewDir: string;


implementation

uses Unit4, uTestedFiles;

{$R *.dfm}

procedure TfmJoinFiles.btAddClick(Sender: TObject);
begin
  listFilestojoin.Items.Add(FileListBox1.FileName);
  if listFilestojoin.Items.Count > 0 then begin
    btSave.Enabled:=True;
    //btSave2.Enabled:=True;
    end else begin
    btSave.Enabled:=False;
    //btSave2.Enabled:=False;
  end;
end;

procedure TfmJoinFiles.btRemoveClick(Sender: TObject);
begin
  listFilestojoin.Items.Delete(listFilestojoin.ItemIndex);
  if listFilestojoin.Items.Count > 0 then begin
    btSave.Enabled:=True;
    //btSave2.Enabled:=True
    end else begin
    btSave.Enabled:=False;
  end;
end;

procedure TfmJoinFiles.DirectoryListBox1Change(Sender: TObject);
var
  Month, Day: string;
begin
  Day:=Copy(DateToStr(Date), 1 ,2);
  Month:=Copy(DateToStr(Date), 4 ,2);
  edResultingName.Text:=DirectoryListBox1.Directory+'\'+edDescription.Text+'- Joined '+Month+'-'+Day+'.goi';
end;

procedure TfmJoinFiles.btSaveClick(Sender: TObject);
var
  goiFilestoProcess: array of TGoifile;
  tempGoifile: array of TextFile;
  i: integer;
  tfLine: string;
begin
  SetLength(goiFilestoProcess, listFilestojoin.Items.Count);

  for i:=0 to listFilestojoin.Items.Count-1 do begin
      goiFilestoProcess[i].Name:=listFilestojoin.Items[i];
  end;

  SetLength(tempGoifile, listFilestojoin.Items.Count);

  Progressbar1.Max:=(listFilestojoin.Items.Count*4)+6;
  Progressbar1.Position:=0;

  for i:=0 to listFilestojoin.Items.Count-1 do begin
    Assignfile(tempGoifile[i], goiFilestoprocess[i].Name);
    Reset(tempGoifile[i]);

    Readln(tempGoifile[i], tfLine);
    goiFilestoprocess[i].Description:=tfLine;

    Readln(tempGoifile[i], tfLine);
    goiFilestoprocess[i].Files[1]:=tfLine;
    Readln(tempGoifile[i], tfLine);
    goiFilestoprocess[i].Files[2]:=tfLine;
    Readln(tempGoifile[i], tfLine);
    goiFilestoprocess[i].Files[3]:=tfLine;
    Readln(tempGoifile[i], tfLine);
    goiFilestoprocess[i].Files[4]:=tfLine;
    Readln(tempGoifile[i], tfLine);
    goiFilestoprocess[i].Files[5]:=tfLine;
    Closefile(tempGoifile[i]);
  end;

  JoinGoifiles(goiFilestoprocess, edResultingName.Text, edDescription.Text, true);
  //end;//if Savedialog1.Execute then begin
end;

procedure TfmJoinfiles.CreateRandomVocabulary(Goifiles: array of TGoiFile; Newfilename: string; Descritpion: string);
begin
//
end;

procedure TfmJoinFiles.FormShow(Sender: TObject);
begin
  DirectoryListBox1Change(Sender);
  DirectoryListBox1.Enabled:=True;
  FileListBox1.Enabled:=True;
  btAuto.Enabled:=True;
  listFilestojoin.ScrollWidth:=350;
  DirectoryListBox1.Directory:=AppPath;
  edDescription.Text:='';
end;

procedure TfmJoinFiles.btAutoClick(Sender: TObject);
var
  srDir, srFiles: TSearchRec;
  RootDir, CurrDir: string;
  Found: integer;
begin
  RootDir:=DirectoryListBox1.Directory;
  FindFirst(RootDir+'\*.*', faDirectory, srDir);
  FindNext(srDir);

  while FindNext(srDir) = 0 do
  begin
    if DirectoryExists(srDir.Name) then
    begin
    CurrDir:=(srDir.Name);
    //Found:=FindFirst(CurrDir+'\w*.txt', faArchive, srFiles);
    Found:=FindFirst(CurrDir+'\*.goi', faArchive, srFiles);
    while Found = 0 do begin
      listFilestojoin.Items.Add(GetCurrentDir+'\'+CurrDir+'\'+srFiles.Name);
      Found:=FindNext(srFiles);
    end;
    end;
  end;
  if listFilestojoin.Items.Count > 1 then
    begin
    btSave.Enabled:=True;
    //btSave2.Enabled:=True;
    //btAuto.Enabled:=False;
    //DirectoryListBox1.Enabled:=False;
    //FileListBox1.Enabled:=False;
    end;
    FindClose(srDir);
    FindClose(srFiles);
end;

procedure TfmJoinFiles.btCloseClick(Sender: TObject);
begin
  listFilestojoin.Clear;
  ProgressBar1.Position:=0;
end;

procedure TfmJoinFiles.FileListBox1Change(Sender: TObject);
begin
  btAdd.Enabled:=FileListBox1.Items.Count >0;
end;

procedure TfmJoinFiles.BitBtn1Click(Sender: TObject);
begin
  listFilestojoin.Clear;
  btSave.Enabled:=False;
  //btSave2.Enabled:=False;
end;

function TfmJoinFiles.GetFileHandle(Filename1: string): Cardinal;
begin
  GetFileHandle:=CreateFile(PCHAR(Filename1),
  GENERIC_READ, 0, nil,  OPEN_EXISTING,
  FILE_ATTRIBUTE_NORMAL, 0)
end;

procedure TfmJoinFiles.JoinGoifiles(Goifiles: array of TGoifile; Newfilename, Description: string; EraseRandom: boolean);
var
  NewGoifile: TGoifile;
  lGfiles, i, k, l, LinesCopied, Fileslength: integer;
  gFiles: array[1..5] of string;
  newFile1, newFile2, newFile3, newFile4, newFile5: TextFile;
  tempfile1, tempfile2, tempfile3, tempfile4: TextFile;
  newFiles: array[1..5] of Textfile;
  tempFiles: array[1..4] of Textfile;
  tempGoifiles: array of TextFile;
  tfLine: unicodestring;
  FileNamesTojoin: array[1..4] of string;
  rndNum1: integer; //Número al azar para borrar de las listas y luego crear una
                    //lista de vocabulario random...
begin
  Filemode:=2;
  lGfiles:=Length(Goifiles);
  FilesLength:=0;
  LinesCopied:=0;
  SetLength(tempGoifiles, lGfiles);
  fmTestedFiles.ProgressBar1.Max:=(lGfiles*4)+6;
  fmTestedFiles.ProgressBar1.Position:=0;
  fmTestedFiles.ProgressBar1.Visible:=True;
  fmTestedFiles.tempListbox.Clear;
  fmTestedFiles.Listbox1.Clear;
  fmTestedFiles.Listbox2.Clear;
  fmTestedFiles.Listbox3.Clear;
  fmTestedFiles.Listbox4.Clear;

  gFiles[1]:=Form1.Getgroupfilename(NewFilename, 'k', '');
  gFiles[2]:=Form1.Getgroupfilename(NewFilename, 'm', '');
  gFiles[3]:=Form1.Getgroupfilename(NewFilename, 'r', '');
  gFiles[4]:=Form1.Getgroupfilename(NewFilename, 'rr', '');
  gFiles[5]:=Form1.Getgroupfilename(NewFilename, 'l', '');
    //CreateDir(ExtractFilePath(FileName)+NewDir);

  i:=0; k:=1;
  while i<lGfiles do begin
    fmTestedFiles.tempListbox.Items.LoadFromFile(Goifiles[i].Files[1]);
    fmTestedFiles.Listbox1.Items.AddStrings(fmTestedFiles.tempListbox.Items);
    fmTestedFiles.ProgressBar1.Position:=fmTestedFiles.ProgressBar1.Position+1;
    Progressbar1.Position:=Progressbar1.Position+1;

    fmTestedFiles.tempListbox.Items.LoadFromFile(Goifiles[i].Files[2]);
    fmTestedFiles.Listbox2.Items.AddStrings(fmTestedFiles.tempListbox.Items);
    fmTestedFiles.ProgressBar1.Position:=fmTestedFiles.ProgressBar1.Position+1;
    Progressbar1.Position:=Progressbar1.Position+1;

    fmTestedFiles.tempListbox.Items.LoadFromFile(Goifiles[i].Files[3]);
    fmTestedFiles.Listbox3.Items.AddStrings(fmTestedFiles.tempListbox.Items);
    fmTestedFiles.ProgressBar1.Position:=fmTestedFiles.ProgressBar1.Position+1;
    Progressbar1.Position:=Progressbar1.Position+1;

    fmTestedFiles.tempListbox.Items.LoadFromFile(Goifiles[i].Files[4]);
    fmTestedFiles.Listbox4.Items.AddStrings(fmTestedFiles.tempListbox.Items);
    fmTestedFiles.ProgressBar1.Position:=fmTestedFiles.ProgressBar1.Position+1;
    Progressbar1.Position:=Progressbar1.Position+1;

    inc(i);
  end;
  //For debug
  {form1.ListBox1.Items:=fmTestedFiles.Listbox1.Items;
  form1.ListBox2.Items:=fmTestedFiles.Listbox2.Items;
  form1.ListBox3.Items:=fmTestedFiles.Listbox3.Items;}

  {for i:=0 to fmTestedFiles.Listbox1.Items.Count do begin
    if fmTestedFiles.Listbox1.Items[i]='' then fmTestedFiles.Listbox1.Items.Delete(i);
  end;}


  //Antes de guardar las listas unidas se fija si hay que borrar items al azar.
  //Esto se llama desde la ventana para crear listas de vocabulario al azar.
  if EraseRandom then begin
    while (fmTestedFiles.Listbox1.Items.Count) > Strtoint(edWordsNum.Text) do begin
      rndNum1:=random(fmTestedFiles.Listbox1.Items.Count-1);
      fmTestedFiles.Listbox1.Items.Delete(rndNum1);
      fmTestedFiles.Listbox2.Items.Delete(rndNum1);
      fmTestedFiles.Listbox3.Items.Delete(rndNum1);
      fmTestedFiles.Listbox4.Items.Delete(rndNum1);
    end;


  end;


  fmTestedFiles.Listbox1.Items.SaveToFile(gFiles[1], TEncoding.Unicode);
  fmTestedFiles.ProgressBar1.Position:=fmTestedFiles.ProgressBar1.Position+1;
  Progressbar1.Position:=Progressbar1.Position+1;

  fmTestedFiles.Listbox2.Items.SaveToFile(gFiles[2], TEncoding.Unicode);
  fmTestedFiles.ProgressBar1.Position:=fmTestedFiles.ProgressBar1.Position+1;
  Progressbar1.Position:=Progressbar1.Position+1;

  fmTestedFiles.Listbox3.Items.SaveToFile(gFiles[3], TEncoding.Unicode);
  fmTestedFiles.ProgressBar1.Position:=fmTestedFiles.ProgressBar1.Position+1;
  Progressbar1.Position:=Progressbar1.Position+1;

  fmTestedFiles.Listbox4.Items.SaveToFile(gFiles[4], TEncoding.Unicode);
  fmTestedFiles.ProgressBar1.Position:=fmTestedFiles.ProgressBar1.Position+1;
  Progressbar1.Position:=Progressbar1.Position+1;

  Assignfile(newFiles[5], gFiles[5]);
  Rewrite(newFiles[5]);
  Writeln(newFiles[5], Description);
  Writeln(newFiles[5], '');
  Writeln(newFiles[5], '*********************************************');
  Writeln(newFiles[5], '* Created: '+Datetimetostr(Now)+'*');
  Writeln(newFiles[5], '*********************************************');
  Writeln(newFiles[5], '');
  Writeln(newFiles[5], 'The following files were joined: ');
  for k:=0 to lGfiles-1 do Writeln(newFiles[5], ' -->'+GoiFiles[k].Name);
  Writeln(newFiles[5], '');
  Writeln(newFiles[5], 'Lines copied: '+Inttostr(fmTestedFiles.Listbox1.Items.Count));
  //Inttostr(LinesCopied div 4));
  Writeln(newFiles[5], '________________________________________________');
  Closefile(newFiles[5]);

  Form1.SaveGoiFile(gFiles[1], gFiles[2], gFiles[3], gFiles[4], gFiles[5],
    NewFilename, '02', Description);
  fmTestedFiles.ProgressBar1.Position:=fmTestedFiles.ProgressBar1.Position+1;
  Progressbar1.Position:=Progressbar1.Position+1;

  StoredlistIndex:=-1;WrongslistIndex:=-1;
  fmTestedfiles.ListView1.ItemIndex:=-1;
  fmTestedfiles.ListView1.Enabled:=false;
  fmResults.StoreFile(WrongsFilename, NewFilename, Description, 0);
  fmTestedFiles.ProgressBar1.Position:=fmTestedFiles.ProgressBar1.Position+1;
  Progressbar1.Position:=Progressbar1.Position+1;

  fmTestedfiles.ListView1.Enabled:=true;
  Form1.ShowStoredFiles(WrongsFilename, 'File not updated!', '20');
end;

end.




