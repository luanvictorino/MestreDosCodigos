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
  nNumero: Real;
  sDecimais: String;
  nTamanhoNumero: Integer;
begin
  sNumero := StringReplace(sNumero, '.', ',', [rfReplaceAll]);
  sDecimais := copy(sNumero, pos(',', sNumero)+ 1, Length(sNumero));
  nNumero := StrToFloat(sNumero);
  sNumero := FormatFloat('0.00', nNumero);

  nTamanhoNumero := Length(sNumero);
  if Length(sDecimais) = 1 then
    sNumero := copy(sNumero, 1, Pred(nTamanhoNumero));

  Result := sNumero;
end;

function NumeroValido(sNumero: String): Boolean;
var
  nNumero: Extended;
begin
  Result := True;

  sNumero := StringReplace(sNumero, '.', ',', [rfReplaceAll]);
  if not TryStrToFloat(sNumero, nNumero) then
  begin
    Result := False;
    Exit;
  end;

  sNumero := FormatarNumero(sNumero);
  if Length(sNumero) > 15 then
    Exit;

  Result := True;
end;

procedure main;
var
  sNumero: String;
  sNumeroPorExtenso: String;
  nTamanhoNumero: Integer;
begin
  sNumero := EmptyStr;
  repeat
    Write('Digite um número ou digite ''sair'' para sair: ');
    Readln(sNumero);

    if sNumero.ToLower = 'sair' then
      Break;

    if not NumeroValido(sNumero) then
    begin
      Writeln('Número inválido!');
      Writeln(EmptyStr);
      Continue;
    end;

    nTamanhoNumero := Length(sNumero);
    if nTamanhoNumero > 15 then
    begin
      Writeln('Digite um número menor do que 1 trilhão!!');
      Continue;
    end;

    sNumero := FormatarNumero(sNumero);
    sNumeroPorExtenso := NumeroPorExtenso(sNumero);
    Writeln('Número por extenso: '+sNumeroPorExtenso);
    Writeln;
  until False;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
