program mission16;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {fMain},
  uClassReader in 'uClassReader.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TfMain, fMain);
  Application.Run;

  ReportMemoryLeaksOnShutdown := True;
end.
