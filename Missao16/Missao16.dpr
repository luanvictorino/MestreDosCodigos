program Missao16;

uses
  Vcl.Forms,
  uMissao16 in 'uMissao16.pas' {fMissao16},
  uLeitorClasse in 'uLeitorClasse.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Light Slate');
  Application.CreateForm(TfMissao16, fMissao16);
  Application.Run;
end.
