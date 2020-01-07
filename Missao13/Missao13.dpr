//////////////////////////////////////////////////////////////
//   Autor: Luan Victorino                                  //
//    Data: 24/12/2019                                      //
//  Miss�o: Crie uma Interface com um m�todo de leitura de  //
//          arquivos (LerDoArquivo) e outra Interface com   //
//          um m�todo de escrita de arquivos                //
//          (SalvarParaArquivo). Escreva uma classe que     //
//          implemente essas duas Interfaces, cujos m�todos //
//          devem carregar e salvar o conte�do dessa classe.//
//          Dica: O conte�do pode ser uma TStringList       //
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
  arquivo: TArquivo;
begin
  arquivo := TArquivo.Create;
  arquivo.LerDoArquivo;
end;

procedure SalvarParaArquivo;
var
  arquivo: TArquivo;
begin
  arquivo := TArquivo.Create;
  arquivo.SalvarParaArquivo;
end;

procedure main;
begin
  SalvarParaArquivo;
  LerDoArquivo;
  readln;
end;

begin
  main;
end.
