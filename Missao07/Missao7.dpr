//////////////////////////////////////////////////////////////
//   Autor: Luan Victorino                                  //
//    Data: 11/12/2019                                      //
//  Miss�o: Escreva uma DLL que transcreva um dado n�mero   //
//          por extenso. Construa um programa console que   //
//          fa�a o carregamento est�tico da DLL. Neste      //
//          programa, o usu�rio poder� entrar com um n�mero //
//          qualquer e, como sa�da, o programa dever�       //
//          transcrever o n�mero por extenso em tela.       //
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
    Write('Informe um n�mero ou digite ''sair'' para sair: ');
    Readln(sNumero);

    bSairDoPrograma := sNumero.ToLower = 'sair';
    if bSairDoPrograma then
      Break;

    if not ValidarNumero(sNumero) then
    begin
      Writeln('N�mero inv�lido ou maior que 1 trilh�o!');
      Writeln(EmptyStr);
      Continue;
    end;

    sNumero := FormatarNumero(sNumero);
    sNumeroPorExtenso := NumeroPorExtenso(sNumero);
    Writeln('N�mero por extenso: '+sNumeroPorExtenso);
    Writeln;
  until bSairDoPrograma;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
