unit uReportWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfmReportWindow = class(TForm)
    edReportName: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Generatewronganswersreport(Filename1, ReportName: string);
  end;

var
  fmReportWindow: TfmReportWindow;

implementation

uses uDirectories, Unit4, Unit1;

{$R *.dfm}

procedure TfmReportWindow.BitBtn1Click(Sender: TObject);
begin
  //Generatewronganswersreport(AppPath+Unit1.LogFile1, Savedialog1.Filename);
end;

procedure TfmReportWindow.SpeedButton1Click(Sender: TObject);
begin
{if fmDirectories.Showmodal =mrOk then
    edReportName.Text:=fmDirectories.DirectoryListBox1.Directory+'\';}
end;

procedure TfmReportWindow.Generatewronganswersreport(Filename1, ReportName: string);
var
  File1, File2, File3: TextFile;
  fLine, pLine, kReportName, rReportName: string;
  i: integer;
begin
  kReportName:=ExtractFilePath(ReportName)+'k'+ExtractFileName(ReportName)+'.txt';
  rReportName:=ExtractFilePath(ReportName)+'r'+ExtractFileName(ReportName)+'.txt';
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
//  Form1.SaveGoiFile(kReportName, kReportName, kReportName, rReportName, ReportName, Savedialog1.Filename, '10');
end;

end.
