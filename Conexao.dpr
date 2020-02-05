program Conexao;

uses
  Forms,
  UCC in 'UCC.pas' {FCodex};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Codex';
  Application.CreateForm(TFCodex, FCodex);
  Application.Run;
end.
