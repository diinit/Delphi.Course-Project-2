program MagicSquare;

uses
  Forms,
  Main in 'Main.pas' {GLAV},
  MSCreate in 'MSCreate.pas' {MAG},
  ErrorSize in 'ErrorSize.pas' {Error},
  MiniGame in 'MiniGame.pas' {GAME},
  ErrorCheck in 'ErrorCheck.pas' {Prover},
  WindowSave in 'WindowSave.pas' {SaveMS};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Магические квадраты';
  Application.HelpFile := 'C:\Users\mtx\Desktop\1\Руководство пользователя.chm';
  Application.CreateForm(TGLAV, GLAV);
  Application.CreateForm(TMAG, MAG);
  Application.CreateForm(TError, Error);
  Application.CreateForm(TGAME, GAME);
  Application.CreateForm(TProver, Prover);
  Application.CreateForm(TSaveMS, SaveMS);
  Application.Run;
end.
