unit MiniGame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TGAME = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Button1: TButton;
    Button2: TButton;
    Back1: TImage;
    Back2: TImage;
    Prov1: TImage;
    Prov2: TImage;
    Clean1: TImage;
    Clean2: TImage;
    Exit1: TImage;
    Min: TImage;
    ImTrue: TImage;
    ImFalse: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Back1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Back2Click(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure Prov1MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure Clean1MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure Clean2Click(Sender: TObject);
    procedure Prov2Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MinClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GAME: TGAME;

implementation
uses ErrorCheck, Main;

{$R *.dfm}

procedure TGAME.Button1Click(Sender: TObject);
var
 a:array [1..3,1..3] of integer;
 pr:boolean;
 i,sum: integer;
BEGIN                                 //проверка на пустые поля
if (Length(Trim(Edit1.Text))=0)or
   (Length(Trim(Edit2.Text))=0)or
   (Length(Trim(Edit3.Text))=0)or
   (Length(Trim(Edit4.Text))=0)or
   (Length(Trim(Edit5.Text))=0)or
   (Length(Trim(Edit6.Text))=0)or
   (Length(Trim(Edit7.Text))=0)or
   (Length(Trim(Edit8.Text))=0)or
   (Length(Trim(Edit9.Text))=0)then
   begin Prover.Show; Exit; end;
 a[1,1]:=StrToInt(Edit1.Text);          //считывание чисел
 a[1,2]:=StrToInt(Edit2.Text);
 a[1,3]:=StrToInt(Edit3.Text);
 a[2,1]:=StrToInt(Edit4.Text);
 a[2,2]:=StrToInt(Edit5.Text);
 a[2,3]:=StrToInt(Edit6.Text);
 a[3,1]:=StrToInt(Edit7.Text);
 a[3,2]:=StrToInt(Edit8.Text);
 a[3,3]:=StrToInt(Edit9.Text);
 pr:=true;
 if a[1,1]<>a[1,2] then begin           //проверка сумммы
 sum:=0;
 for i:=1 to 3 do
  sum:=sum+a[1,i];
 for i:=1 to 3 do
  if(sum <> a[i,1]+a[i,2]+a[i,3]) then
    pr:=false;
 for i:=1 to 3 do
  if(sum <> a[1,i]+a[2,i]+a[3,i]) then
    pr:=false;
  if(sum <> a[1,1]+a[2,2]+a[3,3]) then
    pr:=false;
  if (pr=false) then                   //вывод результата
    ImFalse.Visible:=true; ImTrue.Visible:=false;
  if (pr=true) then
    ImTrue.Visible:=true; ImFalse.Visible:=false;
    end;
    if a[1,1]=a[1,2] then begin
    ImFalse.Visible:=true; ImTrue.Visible:=false;
    end;
END;

procedure TGAME.Button2Click(Sender: TObject);  //очистка полей
begin
Edit1.Clear; Edit2.Clear; Edit3.Clear;
Edit4.Clear; Edit5.Clear; Edit6.Clear;
Edit7.Clear; Edit8.Clear; Edit9.Clear;
end;

procedure TGAME.MinClick(Sender: TObject);
begin
Application.Minimize;
end;

procedure TGAME.Exit1Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TGAME.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
Glav.perform(WM_SysCommand,$F012,0);
end;

procedure TGAME.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);  //контекстное меню
begin
if Button = mbRight then GLAV.PopupMenu1.Popup(326, 151);
end;

procedure TGAME.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8])then Key:=#0;
end;

procedure TGAME.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8])then Key:=#0;
end;

procedure TGAME.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8])then Key:=#0;
end;

procedure TGAME.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8])then Key:=#0;
end;

procedure TGAME.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8])then Key:=#0;
end;

procedure TGAME.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8])then Key:=#0;
end;

procedure TGAME.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8])then Key:=#0;
end;

procedure TGAME.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8])then Key:=#0;
end;

procedure TGAME.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8])then Key:=#0;
end;

procedure TGAME.FormCreate(Sender: TObject);
begin
Game.Color:=GLAV.Color;
Edit1.Color:=$00D52AAC;   Edit2.Color:=Edit1.Color; Edit3.Color:=Edit1.Color;
Edit4.Color:=Edit1.Color; Edit5.Color:=Edit1.Color; Edit6.Color:=Edit1.Color;
Edit7.Color:=Edit1.Color; Edit8.Color:=Edit1.Color; Edit9.Color:=Edit1.Color;
ImTrue.Visible:=false; ImFalse.Visible:=false;
end;

procedure TGAME.Prov1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Prov1.Visible:=false; Prov2.Visible:=true;
end;

procedure TGAME.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Back2.Visible:=false;
Prov2.Visible:=false; Prov1.Visible:=true;
Clean2.Visible:=false; Clean1.Visible:=true;
end;
procedure TGAME.Back1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Back2.Visible:=true;
end;

procedure TGAME.Back2Click(Sender: TObject);
begin
GAME.Close;
GLAV.Show;
end;

procedure TGAME.Clean1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Clean1.Visible:=false; Clean2.Visible:=true;
end;

procedure TGAME.Clean2Click(Sender: TObject);
begin
Button2.Click;
end;

procedure TGAME.Prov2Click(Sender: TObject);
begin
Button1.Click;
end;
end.
