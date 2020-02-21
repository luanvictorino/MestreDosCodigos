//////////////////////////////////////////////////////////////
//   Autor: Luan Victorino                                  //
//    Data: 04/12/2019                                      //
//  Miss�o: Em uma aplica��o console, construa um programa  //
//          que fa�a o c�lculo fatorial do n�mero informado //
//          pelo usu�rio.                                   //
//////////////////////////////////////////////////////////////
program Missao1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Winapi.Windows;

function Fatorial(const nValor: Int64): Int64;
begin
  if nValor in [0, 1] then
    Result := 1
  else
    Result := nValor * Fatorial(Pred(nValor));
end;

function ValidarValor(const sValor: String): Boolean;
var
  nValor: Int64;
begin
  Result := False;

  if not TryStrToInt64(sValor, nValor) then
    Exit;

  Result := nValor in [0..20];
end;

procedure main;
var
  nValor: Int64;
  sValor: String;
  bSairDoPrograma: Boolean;
begin
  Writeln('Informe um n�mero de 0 a 20 e tecle ''Enter'' para descobrir seu '
           + 'fatorial ou digite ''Sair'' para sair do programa: ');
  repeat
    Write('Informe um n�mero: ');
    Readln(sValor);

    bSairDoPrograma := sValor.ToLower = 'sair';
    if bSairDoPrograma then
      Break;

    if not ValidarValor(sValor) then
    begin
      Writeln('Valor inv�lido!');
      Writeln(string.Empty);
      Continue;
    end;

    nValor := StrToInt64(sValor);
    Writeln('O fatorial de ' + nValor.ToString +' �: ' + Fatorial(nValor).ToString);
    Writeln(EmptyStr);
  until bSairDoPrograma;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
