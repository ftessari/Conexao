unit UCC;
{
  +--------------------------------+
  |     Conexão         v:0.1      |
  +--------------------------------+
  |--------------------------------|   ^___^
  +--------------------------------+  (=ò_ó=) <- Miauh!!
  |  Dev. Lain Iwakura             |  (-v-v-)&
  |    lainiwakura@riseup.net      |
  |       Sociedade Cyberia        |
  |             cy.::        2014  |
  +--------------------------------+

  +--------------------------------+
  |        .:: Default ::.         |
  +--------------------------------+
  | [Form]                         |
  |  AutoScroll = True             |
  |  AutoSize = False              |
  |  WindowsState = wsMaximized    |
  |  Position = poDefault          |
  |  Color = clBackground          |
  |--------------------------------|
  |OBS.: Necessário iniciar com    |
  |      Altura e Largura em 0     |
  +--------------------------------+
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, JvWavePlayer, JvComponentBase, JvExControls,
  ComCtrls, mmsystem;

type
  TFCodex = class(TForm)
    StringGrid: TStringGrid;
    TimerScrollDown: TTimer;
    TimerCharChange: TTimer;
    TimerStartLine: TTimer;
    TimerSpeedy: TTimer;
    WavePlayerShumman: TJvWavePlayer;
    WavePlayerMusic: TJvWavePlayer;
    TimerControl: TTimer;
    procedure FormShow(Sender: TObject);
    procedure TimerScrollDownTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimerCharChangeTimer(Sender: TObject);
    procedure TimerStartLineTimer(Sender: TObject);
    procedure TimerSpeedyTimer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
  var
    y, z, SpeedyCell: integer;
    { Public declarations }
  end;

var
  FCodex: TFCodex;

implementation

{$R *.dfm}

function NewChar: Char;
begin
  Result := chr(48 + random(122 - 47));
end;

procedure TFCodex.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Release;
end;

procedure TFCodex.FormCreate(Sender: TObject);
begin
  z := 20; // Padrão
  y := -2 * z;

end;

procedure TFCodex.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Close;
end;

procedure TFCodex.FormShow(Sender: TObject);
begin
  SpeedyCell := 1; // Velocidade do Charc

  With StringGrid do
  Begin
    Height := FCodex.Height + 5 * z;
    Width := FCodex.Width + 5 * z;
    Top := -2 * z;
    Left := -z;
    RowCount := Height div z;
    ColCount := Width div z;
    DefaultRowHeight := z;
    DefaultColWidth := z;
  End;
SndPlaySound('rschumann.wav', SND_ASYNC or SND_LOOP);
end;

procedure TFCodex.TimerCharChangeTimer(Sender: TObject);
var // Escolhe caracteres (Random)
  c, r: integer;
begin
  for c := 0 to StringGrid.ColCount - 1 do
    for r := 0 to StringGrid.RowCount - 2 do
    Begin
      if StringGrid.Cells[c, r] <> '' then
        if StringGrid.Cells[c, r + 1] = '' then
          StringGrid.Cells[c, r] := NewChar;
    End;

  for c := 0 to StringGrid.ColCount - 1 do
  begin
    if StringGrid.Cells[c, StringGrid.RowCount - 1] <> '' then
      if random(30) = 15 then
        StringGrid.Cells[c, 0] := '';
  end;
end;

procedure TFCodex.TimerScrollDownTimer(Sender: TObject);
var // Desce a Grid
  c, r: integer;
begin
  inc(y);
  if y = 0 then
  begin
    y := -z;

    for c := 0 to StringGrid.ColCount - 1 do
      for r := StringGrid.RowCount - 1 downto 1 do
        StringGrid.Cells[c, r] := StringGrid.Cells[c, r - 1];

    for c := 0 to StringGrid.ColCount - 1 do
      if StringGrid.Cells[c, 1] <> '' then
        StringGrid.Cells[c, 0] := NewChar;

    StringGrid.Top := y - z;
  end;
end;

procedure TFCodex.TimerSpeedyTimer(Sender: TObject);
var // Incrementando caracteres
  r: integer;
begin
  for r := 0 to StringGrid.RowCount - 1 do
  begin
    if StringGrid.Cells[SpeedyCell, r] = '' then
    Begin
      StringGrid.Cells[SpeedyCell, r] := NewChar;
      break;
    End;
  end;
end;

procedure TFCodex.TimerStartLineTimer(Sender: TObject);
begin // Nova linha
  StringGrid.Cells[random(StringGrid.ColCount - 1), 0] := NewChar;
  SpeedyCell := random(StringGrid.ColCount - 1);
end;

end.
