unit ErrorCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TProver = class(TForm)
    StaticText1: TStaticText;
    Bevel1: TBevel;
    Okey: TImage;

    procedure OkeyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Prover: TProver;

implementation

{$R *.dfm}


procedure TProver.OkeyClick(Sender: TObject);
begin
Prover.Close;
end;

procedure TProver.FormCreate(Sender: TObject);
begin
Prover.Color:=$00F258B0;
StaticText1.Caption:='Квадрат заполнен не полностью. Пожалуйста проверьте ещё раз.'; 
end;

end.
