unit MSCreate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, jpeg, ExtCtrls, OleCtnrs, ComObj;

type
  TMAG = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    StringGrid1: TStringGrid;
    Button2: TButton;
    StaticText1: TStaticText;
    Back1: TImage;
    Back2: TImage;
    OleContainer1: TOleContainer;
    Str1: TImage;
    Str2: TImage;
    SaveDialog1: TSaveDialog;
    Save1: TImage;
    Save2: TImage;
    Sum1: TImage;
    Sum2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Back2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Back1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Str1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Str2Click(Sender: TObject);
    procedure Save1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Save2Click(Sender: TObject);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Sum1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Sum2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const mn=100;  //максимальный размер МК

var
  MAG: TMAG;
  p: Boolean;
  n: Integer;

implementation
uses Main, ErrorSize, WindowSave;

{$R *.dfm}
            {Используется сокращение "магический квадрат" как МК в сносках}

procedure Obmen(var a, b: Integer);
//меняет местами значения двух переменных в массиве в МК
var
  T: Integer;
begin
  T:=a;
  a:=b;
  b:=T;
end;

procedure TMAG.Button1Click(Sender: TObject);
//построене МК
var
  i, j, k, s, b, r, m: Integer;
  MG: Extended;
  a: Array[1 .. mn, 1 .. mn] of Integer; //Массив, макс.размера 100
BEGIN{1}
begin {2}
if (Length(Trim(Edit1.Text))=0) then begin
 Error.Show;
 Exit; end;
 n:=StrToInt(Edit1.Text);
 if n<3 then Error.Show;
 if n>21 then SaveMS.Visible:=true;
 if n>mn then begin
 Error.Show; SaveMs.Visible:=false; Exit;
 end;
 p:=True;
                //НЕЧЕТНЫЕ (3,5,7...)
  if Odd(n) Then
  begin {3}
    i:=1;
    j:=Succ(n div 2);
    for k:=1 To Sqr(n) do
    begin {4}
      a[i,j]:=k;
      if k mod n=0 Then Inc(i)
      Else
      begin {5}
        Dec(i);
        Inc(j);
        if i=0 Then i:=n;
        if j>n Then j:=1
      end{->5}
    end; {->4}
  end {->3}
  Else
                     //ЧЕТНО-ЧЕТНЫЕ(двойная четность, 4,8,12,16...)
  if n mod 4=0 Then
  begin {6}
    k:= 1;
    for i:=1 To n Do
      for j:=1 To n Do
      begin {7}
        a[i,j]:=k;
        Inc(k)
      end; {->7}
    j:=2;
    m:=n div 2;
    for i:=1 To m Do
      for k:=1 To m Div 2 Do
      begin {8}
        if j=Succ(m) Then j:=2
        Else
        if j=(m+2) Then j:=1;
        s:=Succ(n-i);
        b:=Succ(n-j);
        Obmen(a[i,j], a[s,b]);
        Obmen(a[i,b], a[s,j]);
        Inc(j,2)
      end {->8}
  end  {->6}
  Else
  if n<>2 Then   //ОДНОЧЕТНЫЕ МК(кроме двойных, 6,10,14,18...)
  begin {9}
    k:=1;
    for i:=1 To n Do
      for j:=1 To n Do
      begin {10}
        a[i,j]:=k;
        Inc(k)
      end; {->10}
    r:=Pred(n div 2) div 2;
    m:=n div 2;
    for i:=1 To m Do
    begin {11}
      j:=i;
      for k:=1 To r Do
      begin {12}
        if j>m Then j:=1;
        s:=Succ(n-i); b:=Succ(n-j);
        Obmen(a[i,j], a[s,b]);
        Obmen(a[i,b], a[s,j]);
        Inc(j)
      end {->12}
    end; {->11}
        i:=1;
        j:=Succ(r);
        for k:=1 To m Do
        begin {13}
          if j>m Then j:=1;
          s:=Succ(n-i);
          Obmen(a[i,j], a[s,j]);
          Inc(i);
          Inc(j)
        end; {->13}
    i:=1;
    j:=r+2;
    for k:=1 To m Do
    begin {14}
      if j>m Then j:=1;
      b:=Succ(n-j);
      Obmen(a[i,j], a[i,b]);
      Inc(i);
      Inc(j)
    end {->14}
  end {->9}
  Else
  p:=False;

  begin {15}        //вывод построенных МК
    for i:=1 To n Do
    begin {16}
      for j:=1 To n Do
      begin {17}
      if n>=3 then begin
        StringGrid1.ColWidths[0]:= 0;
        StringGrid1.RowHeights[0]:= 0;
        StringGrid1.ColCount:= n + 1;
        StringGrid1.RowCount:= n + 1;
        StringGrid1.Cells[i,j]:= IntToStr(a[j,i]);
        StringGrid1.Visible:=true;  end;
      end; {->17}
    end {->16}
  end;  {->15}
end;
                //расчет магической константы(суммы)
if n>=3 then begin
MG:=(n*(n*n+1)/2);
StaticText1.Caption:=FloatToStr(MG);
end; {->2}
END; {->1}

procedure TMAG.Button2Click(Sender: TObject); //сохранение МК в Excel
var
Excel, WorkBook, Sheet:variant;
i, j: integer;
FileExcel: string;
begin
if SaveDialog1.Execute then
FileExcel:= SaveDialog1.FileName
else
Exit;
Excel:=CreateOleObject('Excel.Application');
Excel.DisplayAlerts:=False;
Excel.Visible:=true;
Workbook:=Excel.Workbooks.Add;
Workbook.SaveAs(FileExcel);
Sheet:= Workbook.ActiveSheet;
 for i:= 0 to StringGrid1.RowCount-1 do
  begin
   for j:= 0 to StringGrid1.ColCount-1 do
   Sheet.Cells[i+1, j+1]:= StringGrid1.Cells[j, i];
  end;
Workbook.Save;
{Workbook.Close;}
{Excel.Quit;}
Excel:= UnAssigned;
end;

procedure TMAG.FormMouseUp(Sender: TObject; Button: TMouseButton; //Появление контекстного меню
  Shift: TShiftState; X, Y: Integer);
begin
if Button = mbRight then GLAV.PopupMenu1.Popup(326, 151);
end;

procedure TMAG.Edit1KeyPress(Sender: TObject; var Key: Char); //Маска ввода только чисел
begin
 if not (Key in ['0'..'9', #8])then Key:=#0;
end;

procedure TMAG.Back2Click(Sender: TObject);
begin
MAG.Close;
GLAV.Show;
end;
      
procedure TMAG.FormCreate(Sender: TObject);
begin
MAG.Color:=GLAV.Color;
StaticText1.Font.Color:=clWhite; StringGrid1.Font.Color:=clWhite;
StaticText1.Color:=MAG.Color;    StringGrid1.Color:=MAG.Color;
Edit1.Color:=$00D52AAC;          StringGrid1.Font.Style:=[fsBold];
end;

procedure TMAG.Back1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Back1.Visible:=false; Back2.Visible:=true;
end;

procedure TMAG.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Back2.Visible:=false; Back1.Visible:=true;
Str2.Visible:=false; Str1.Visible:=true;
Save2.Visible:=false; Save1.Visible:=true;
Sum2.Visible:=false; Sum1.Visible:=true;
end;

procedure TMAG.Str1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Str1.Visible:=false; Str2.Visible:=true;
end;

procedure TMAG.Str2Click(Sender: TObject);
begin
Button1.Click;
end;

procedure TMAG.Save1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Save1.Visible:=false; Save2.Visible:=true;
end;

procedure TMAG.Save2Click(Sender: TObject);
begin
Button2.Click;
end;

procedure TMAG.Sum1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Sum1.Visible:=false; Sum2.Visible:=true;
end;

procedure TMAG.Sum2Click(Sender: TObject);
begin
StaticText1.Visible:=true;
end;

end.
