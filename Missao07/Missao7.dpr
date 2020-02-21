//////////////////////////////////////////////////////////////
//   Autor: Luan Victorino                                  //
//    Data: 11/12/2019                                      //
//  Missão: Escreva uma DLL que transcreva um dado número   //
//          por extenso. Construa um programa console que   //
//          faça o carregamento estático da DLL. Neste      //
//          programa, o usuário poderá entrar com um número //
//          qualquer e, como saída, o programa deverá       //
//          transcrever o número por extenso em tela.       //
//////////////////////////////////////////////////////////////
program Missao7;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.StrUtils;

function NumeroPorExtenso(sNumero: String): String;
  external 'Missao7Dll.dll';

function FormatarNumero(sNumero: String): String;
var
  sDecimais: String;
begin
  sNumero := StringReplace(sNumero, '.', ',', [rfReplaceAll]);
  sDecimais := copy(sNumero, Succ(pos(',', sNumero)), 2);

  sNumero := FormatFloat('0.00', StrToFloat(sNumero));
  if Length(sDecimais) = 1 then
    sNumero := copy(sNumero, 1, Pred(Length(sNumero)));

  Result := sNumero;
end;

function ValidarNumero(sNumero: String): Boolean;
var
  nNumero: Extended;
begin
  Result := False;

  sNumero := StringReplace(sNumero, '.', ',', [rfReplaceAll]);
  if not TryStrToFloat(sNumero, nNumero) then
    Exit;

  sNumero := FormatarNumero(sNumero);
  if Length(sNumero) > 15 then
    Exit;

  Result := True;
end;

procedure main;
var
  sNumero: String;
  sNumeroPorExtenso: String;
  bSairDoPrograma: Boolean;
begin
  repeat
    Write('Informe um número ou digite ''sair'' para sair: ');
    Readln(sNumero);

    bSairDoPrograma := sNumero.ToLower = 'sair';
    if bSairDoPrograma then
      Break;

    if not ValidarNumero(sNumero) then
    begin
      Writeln('Número inválido ou maior que 1 trilhão!');
      Writeln(EmptyStr);
      Continue;
    end;

    sNumero := FormatarNumero(sNumero);
    sNumeroPorExtenso := NumeroPorExtenso(sNumero);
    Writeln('Número por extenso: '+sNumeroPorExtenso);
    Writeln;
  until bSairDoPrograma;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
