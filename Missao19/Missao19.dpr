program Missao19;

uses
  Vcl.Forms,
  uMissao19 in 'uMissao19.pas' {fMissao19},
  uXmlMissao19 in 'uXmlMissao19.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMissao19, fMissao19);
  Application.Run;
end.
