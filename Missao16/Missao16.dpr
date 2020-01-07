program Missao16;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uLeitorClasse in 'uLeitorClasse.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
