program Missao16;

uses
  Vcl.Forms,
  uMissao16 in 'uMissao16.pas' {fMissao16},
  uLeitorClasse in 'uLeitorClasse.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMissao16, fMissao16);
  Application.Run;
end.
