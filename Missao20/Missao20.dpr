program Missao20;

uses
  Vcl.Forms,
  uMissao20 in 'uMissao20.pas' {fMissao20},
  xmlMissao20 in 'xmlMissao20.pas',
  uManipularXml in 'uManipularXml.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMissao20, fMissao20);
  Application.Run;
end.
