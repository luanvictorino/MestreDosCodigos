//////////////////////////////////////////////////////////////
//   Autor: Luan Victorino                                  //
//    Data: 24/12/2019                                      //
//  Missão: Crie uma Interface com um método de leitura de  //
//          arquivos (LerDoArquivo) e outra Interface com   //
//          um método de escrita de arquivos                //
//          (SalvarParaArquivo). Escreva uma classe que     //
//          implemente essas duas Interfaces, cujos métodos //
//          devem carregar e salvar o conteúdo dessa classe.//
//          Dica: O conteúdo pode ser uma TStringList       //
//////////////////////////////////////////////////////////////
program Missao13;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uInterface in 'uInterface.pas',
  uArquivo in 'uArquivo.pas';

procedure LerDoArquivo;
var
  oArquivo: TArquivo;
begin
  oArquivo := TArquivo.Create;
  try
    oArquivo.LerDoArquivo;
  finally
    oArquivo.Free;
  end;

end;

procedure SalvarParaArquivo;
var
  oArquivo: TArquivo;
begin
  oArquivo := TArquivo.Create;
  try
    oArquivo.SalvarParaArquivo;
  finally
    oArquivo.Free;
  end;
end;

procedure main;
begin
  SalvarParaArquivo;
  LerDoArquivo;
  readln;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
