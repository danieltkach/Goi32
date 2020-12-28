unit uDirectories;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, FileCtrl;

type
  TfmDirectories = class(TForm)
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmDirectories: TfmDirectories;
  fmSender: TObject;

implementation

uses Unit1;

{$R *.dfm}

procedure TfmDirectories.FormShow(Sender: TObject);
begin
  DirectoryListBox1.Directory:=AppPath;
end;

end.
