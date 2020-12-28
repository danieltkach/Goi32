unit uRegistration1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, ComCtrls, ShellApi;

type
  TfmRegistration = class(TForm)
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Bevel1: TBevel;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    MaskEdit2: TMaskEdit;
    procedure Label1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmRegistration: TfmRegistration;

implementation

{$R *.dfm}

procedure TfmRegistration.Label1Click(Sender: TObject);
begin
ShellExecute(0, nil, 'mailto: hokanokoto@gmail.com',
    nil, nil, SW_SHOWNORMAL);
end;

end.
