unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Menus, ShellAPI;

type
  TGLAV = class(TForm)
    Button2: TButton;
    Button3: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Postr1: TImage;
    Postr2: TImage;
    Game1: TImage;
    Game2: TImage;
    Button1: TButton;
    Help1: TImage;
    Help2: TImage;
    Back1: TImage;
    Back2: TImage;
    Min: TImage;
    Exit: TImage;
    N6: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure Postr2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Game2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Back2Click(Sender: TObject);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure N1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Postr1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Game1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Help1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Back1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure N2Click(Sender: TObject);
    procedure MinClick(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Help2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GLAV: TGLAV;

implementation
uses MSCreate, MiniGame;

{$R *.dfm}

procedure TGLAV.Button2Click(Sender: TObject);
//открытие формы с игрой
begin
GAME.Show;
GLAV.Hide;
end;

procedure TGLAV.FormCreate(Sender: TObject);
begin
GLAV.Color:=$0049012B;
end;

procedure TGLAV.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if Button = mbRight then PopupMenu1.Popup(326, 151);
end;

procedure TGLAV.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
if Msg.CharCode=(Ord('M')) then //горячая клавиша, открывающая форму построения
  begin
    Handled:=true;
    Game.Hide;
    Glav.Show;
    Mag.Hide;
  end;

if Msg.CharCode=(Ord('S')) then //горячая клавиша, открывающая форму построения
  begin
    Button1.Click;
    Handled:= true;
    Game.Hide;
    Glav.Hide;
  end;

if Msg.CharCode =(Ord('G'))then //горячая клавиша, открывающая игру
  begin
    Button2.Click;
    Handled:= true;
    Mag.Hide;
    Glav.Hide;
  end;

if Msg.CharCode =(Ord('H')) then //горячая клавиша, открывающая справку
  begin
    Button3.Click;
    Handled:= true;
  end;
end;

procedure TGLAV.N5Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TGLAV.N3Click(Sender: TObject);
begin
Button2.Click;
end;

procedure TGLAV.Postr1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Postr2.Visible:=True;
Postr1.Visible:=False;
end;

procedure TGLAV.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Postr1.Visible:=True; Postr2.Visible:=False;
Game1.Visible:=True;  Game2.Visible:=False;
Help1.Visible:=True;  Help2.Visible:=False;
Back1.Visible:=True;  Back2.Visible:=False;
end;

procedure TGLAV.Postr2Click(Sender: TObject);
begin
Button1.Click;
end;

procedure TGLAV.Game1MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
begin
Game2.Visible:=True; Game1.Visible:=False;
end;

procedure TGLAV.Button1Click(Sender: TObject);
begin
MAG.Show;
GLAV.Hide;
end;

procedure TGLAV.Game2Click(Sender: TObject);
begin
Button2.Click;
end;

procedure TGLAV.Help1MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
begin
Help2.Visible:=True; Help1.Visible:=False;
end;

procedure TGLAV.Back1MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
begin
Back2.Visible:=True; Back1.Visible:=False;
end;

procedure TGLAV.Back2Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TGLAV.N1Click(Sender: TObject);
begin
Glav.Show;
end;

procedure TGLAV.N2Click(Sender: TObject);
begin
Glav.Hide;
MAG.Show;
end;

procedure TGLAV.MinClick(Sender: TObject);      //свернуть
begin
Application.Minimize;
end;


procedure TGLAV.ExitClick(Sender: TObject);     //закрыть
begin
Application.Terminate;
end;


procedure TGLAV.N6Click(Sender: TObject);   //написать разработчику
begin
ShellExecute(Handle, nil, 'mailto:di.in.it@ya.ru', nil, nil, SW_SHOW);
end;

procedure TGLAV.Button3Click(Sender: TObject);
begin
ShellExecute(0,PChar('Open'),PChar('Руководство пользователя.chm'), nil, nil, SW_SHOWNORMAL);
end;

procedure TGLAV.Help2Click(Sender: TObject);
begin
Button3.Click;
end;

procedure TGLAV.N4Click(Sender: TObject);
begin
Button3.Click;
end;

end.
