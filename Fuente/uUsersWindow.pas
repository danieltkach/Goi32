unit uUsersWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ExtCtrls, ComCtrls, StdCtrls, Buttons;

type
  TUsersWindow = class(TForm)
    Bevel1: TBevel;
    ImageList1: TImageList;
    ListView1: TListView;
    btNew: TBitBtn;
    btLoad: TBitBtn;
    btDelete: TBitBtn;
    panelNewuser: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    btCreateUser: TBitBtn;
    BitBtn1: TBitBtn;
    procedure btNewClick(Sender: TObject);
    procedure btCreateUserClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UsersWindow: TUsersWindow;

implementation

{$R *.dfm}

procedure TUsersWindow.BitBtn1Click(Sender: TObject);
begin
  panelNewUser.Visible:=false;
end;

procedure TUsersWindow.btCreateUserClick(Sender: TObject);
begin
  panelNewUser.Visible:=false;
end;

procedure TUsersWindow.btNewClick(Sender: TObject);
begin
  edit1.Text:='';
  panelNewUser.Visible:=true;
  edit1.SetFocus;
end;

procedure TUsersWindow.SpeedButton1Click(Sender: TObject);
begin
  panelNewUser.Visible:=false;
end;

end.
