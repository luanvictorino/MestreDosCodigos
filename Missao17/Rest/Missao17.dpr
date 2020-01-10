program Missao17;

uses
  Vcl.Forms,
  uMissao17 in 'uMissao17.pas' {fMissao17};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMissao17, fMissao17);
  Application.Run;
end.
