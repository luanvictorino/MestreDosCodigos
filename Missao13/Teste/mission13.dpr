program mission13;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uInterface in 'C:\Users\luan.victorino\Documents\Embarcadero\Studio\Projects\uInterface.pas',
  uFile in 'C:\Users\luan.victorino\Documents\Embarcadero\Studio\Projects\uFile.pas',
  Vcl.Forms;

procedure SaveFile;
var
  oFile: IFileWrite;
begin
  oFile := TFile.Create(
    ExtractFilePath(Application.exename),
    'Mission 13.txt'
  );

  TFile(oFile).FileList.Add('Row one');
  TFile(oFile).FileList.Add('Row two');
  TFile(oFile).FileList.Add('Row trhee');
  TFile(oFile).FileList.Add('Row four');

  oFile.SaveToFile;
  Writeln('Save file to folder ' + TFile(oFile).Path);
end;

procedure ReadFile;
var
  oFile: IFileRead;
begin
  oFile := TFile.Create(
    ExtractFilePath(Application.exename),
    'Mission 13.txt'
  );

  oFile.ReadToFile;

  Writeln('Uploaded the file with the following information:');
  Writeln(TFile(oFile).FileList.Text);
end;

procedure main;
begin
  SaveFile;
  ReadFile;

  Readln;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
