program Missao17;

uses
  Vcl.Forms,
  uMissao17 in 'uMissao17.pas' {fMissao17},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Light Slate');
  Application.CreateForm(TfMissao17, fMissao17);
  Application.Run;
end.
