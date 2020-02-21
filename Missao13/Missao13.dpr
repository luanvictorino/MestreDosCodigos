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
  uArquivo in 'uArquivo.pas';

procedure main;
var
  oArquivo: TArquivo;
begin
  oArquivo := TArquivo.Create;
  try
    Writeln('Alimentando dados no arquivo.');
    oArquivo.SalvarParaArquivo;
    Writeln('Arquivo salvo!');

    Writeln('Carregando arquivo: ');
    Writeln(EmptyStr);
    oArquivo.LerDoArquivo;
    Readln;
  finally
    FreeAndNil(oArquivo);
  end;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
