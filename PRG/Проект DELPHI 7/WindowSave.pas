unit WindowSave;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TSaveMS = class(TForm)
    Bevel1: TBevel;
    Sav1: TImage;
    StaticText1: TStaticText;
    procedure FormCreate(Sender: TObject);
    procedure Sav1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SaveMS: TSaveMS;

implementation
uses MSCreate;

{$R *.dfm}

procedure TSaveMS.FormCreate(Sender: TObject);
begin
StaticText1.Caption:='���������� ������� ��������� �� ���������. ��������� � Microsoft Excel, ����� ��������� ������� ���������� �������. ';
SaveMS.Color:=$00F258B0;
end;

procedure TSaveMS.Sav1Click(Sender: TObject);
begin
SaveMS.Close;
end;

end.
