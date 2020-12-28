unit uStartup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfmStartup = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    ProgramIcon: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmStartup: TfmStartup;

implementation

{$R *.dfm}

procedure TfmStartup.Timer1Timer(Sender: TObject);
begin
if fmStartup.AlphaBlendValue<50 then Close else
  fmStartup.AlphaBlendValue:=fmStartup.AlphaBlendValue-5;
end;

procedure TfmStartup.FormShow(Sender: TObject);
begin
//  fmStartup.TransparentColorValue:=clBlack;
//  fmStartup.AlphaBlend:=True;
//  fmStartup.AlphaBlendValue:=1;

Timer1.Enabled:=True;
end;

end.
