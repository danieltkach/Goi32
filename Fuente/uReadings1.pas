unit uReadings1;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Menus;

type
  TfmReadings = class(TForm)
    Notebook1: TNotebook;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    Edit3: TEdit;
    OpenDialog1: TOpenDialog;
    OpenDialog2: TOpenDialog;
    Timer1: TTimer;
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Create1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmReadings: TfmReadings;
  File1, File2, File3, File4: TextFile;
  Line1, Line2, NameF4: string;
  Found: boolean;
  Split: boolean;

implementation

{$R *.DFM}

procedure TfmReadings.BitBtn1Click(Sender: TObject);
begin
     Found:=False;
     if Edit1.Text=Edit2.Text then Split:=True else Split:=False;
     AssignFile(File1, Edit1.Text);
     AssignFile(File2, Edit2.Text);
     AssignFile(File3, Edit3.Text+'R.txt');
     if Split then begin
        NameF4:=Edit3.Text+'K.txt';
        AssignFile(File4, NameF4);
        Rewrite(File4);
        end;
     Reset(File1);
     Reset(File2);
     Rewrite(File3);

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
          if Split then Writeln(File4, Copy(Line1, 1, 2));
     end;
     CloseFile(File1);
     CloseFile(File2);
     CloseFile(File3);
     if Split then CloseFile(File4);
     fmReadings.Caption:='Completed';
     Timer1.Enabled:=True;
end;

procedure TfmReadings.SpeedButton1Click(Sender: TObject);
begin
     OpenDialog1.Execute;
     Edit1.Text:=OpenDialog1.FileName;
end;

procedure TfmReadings.SpeedButton2Click(Sender: TObject);
begin
     OpenDialog2.Execute;
     Edit2.Text:=OpenDialog2.FileName;
end;

procedure TfmReadings.Create1Click(Sender: TObject);
begin
     Notebook1.ActivePage:='Create';
end;

procedure TfmReadings.Timer1Timer(Sender: TObject);
begin
  Close;
end;

procedure TfmReadings.Edit1Change(Sender: TObject);
begin
  edit3.Text:=ExtractFilePath(edit1.Text);
end;

end.
