//////////////////////////////////////////////////////////////
//   Autor: Luan Victorino                                  //
//    Data: 04/12/2019                                      //
//  Missão: Em uma aplicação console, construa um programa  //
//          que faça o cálculo fatorial do número informado //
//          pelo usuário.                                   //
//////////////////////////////////////////////////////////////
program Missao1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Winapi.Windows;

function Fatorial(nValor: Int64): Int64;
begin
  if (nValor = 0) or (nValor = 1) then
    Result := 1
  else
    Result := nValor * Fatorial(Pred(nValor));
end;

function ValidarValor(sValor: String): Boolean;
var
  nValor: Int64;
begin
  Result := False;
  if not TryStrToInt64(sValor, nValor) then
    Exit;

  if not(nValor in [0..20]) then
    Exit;

  Result := True;
end;

procedure main;
var
  nValor: Int64;
  sValor: String;
begin
  repeat
    Write('Informe um número de 0 a 20 para descobrir seu fatorial ou'
           + ' digite ''sair'' para sair do programa: ');
    readln(sValor);

    if sValor.ToLower = 'sair' then
      Break;

    if not ValidarValor(sValor) then
    begin
      Writeln('Valor inválido!');
      Writeln(EmptyStr);
      Continue;
    end;

    nValor := StrToInt64(sValor);
    Writeln('O fatorial de ' + nValor.ToString +
            ' é: ' + Fatorial(nValor).ToString);
    Writeln(EmptyStr);
    Continue;
  until False;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
