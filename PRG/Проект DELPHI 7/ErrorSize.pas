unit ErrorSize;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TError = class(TForm)
    StaticText1: TStaticText;
    Button1: TButton;
    Bevel1: TBevel;
    Ok1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Ok1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Error: TError;

implementation

{$R *.dfm}

procedure TError.FormCreate(Sender: TObject);
begin
Error.Color:=$00F258B0;
StaticText1.Caption:='¬ведена неправильна€ размерность. ћинимальна€ размерность 3х3, максимальна€ 100х100.';
end;

procedure TError.Button1Click(Sender: TObject);
begin
Error.Close;
end;

procedure TError.Ok1Click(Sender: TObject);
begin
Button1.Click;
end;

end.
