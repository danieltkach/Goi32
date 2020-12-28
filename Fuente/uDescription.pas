unit uDescription;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfmDescription = class(TForm)
    StaticText1: TStaticText;
    BitBtn1: TBitBtn;
    btCancel: TBitBtn;
    Bevel1: TBevel;
    edDescription: TEdit;
    SaveModePanel: TPanel;
    sbNewItem: TSpeedButton;
    sbUpdate: TSpeedButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    function ShowWindow(Text, DescriptionText, Flags: string): string;
    { Public declarations }
  end;

var
  fmDescription: TfmDescription;

implementation

uses Unit1;

{$R *.dfm}

procedure TfmDescription.FormShow(Sender: TObject);
begin
  //edDescription.Text:=FileDescription;
  edDescription.SetFocus;
end;

function TfmDescription.ShowWindow(Text, DescriptionText, Flags: string): string;
begin
  StaticText1.Caption:=Text;
  if Flags[1]='1' then begin
    btCancel.Visible:=True;
    //SaveModePanel.Visible:=True;
  end else begin
    btCancel.Visible:=False;
    SaveModePanel.Visible:=False;
  end;
  //sbNewItem.Down:=True;
  edDescription.Text:=DescriptionText;
  Showmodal;
  if DescriptionText='' then DescriptionText:='Test with no description';
  ShowWindow:=edDescription.Text;
end;

end.
