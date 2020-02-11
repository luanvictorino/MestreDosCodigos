program Missao20;

uses
  Vcl.Forms,
  uMissao20 in 'uMissao20.pas' {fMissao20},
  uControlarXml in 'uControlarXml.pas',
  xmlMissao20 in 'xmlMissao20.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Light Slate');
  Application.CreateForm(TfMissao20, fMissao20);
  Application.Run;
end.
