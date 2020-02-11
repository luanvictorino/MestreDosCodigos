program Missao19;

uses
  Vcl.Forms,
  uMissao19 in 'uMissao19.pas' {fMissao19},
  uXmlMissao19 in 'uXmlMissao19.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Light Slate');
  Application.CreateForm(TfMissao19, fMissao19);
  Application.Run;
end.
