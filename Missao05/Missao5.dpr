//////////////////////////////////////////////////////////////
//   Autor: Luan Victorino                                  //
//    Data: 06/12/2019                                      //
//  Missão: Em uma aplicação console, construa um programa  //
//          que leia uma lista de frases. Apresente ao      //
//          usuário apenas as frases que formam um          //
//          palíndromo                                      //
//////////////////////////////////////////////////////////////
program Missao5;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.StrUtils,
  System.Math;

function InverterFrase(const sFrase: String): String;
begin
  Result := ReverseString(sFrase);
end;

function RemoverAcentos(const sFrase: String): String;
type
  USAscii20127 = type AnsiString(20127);
begin
  Result := string(USAscii20127(sFrase));
end;

function ValidarPalindromo(const pFrase: String): boolean;
var
  sFraseInvertida: String;
  sFraseFormatada: String;
  sFrase: String;
  nPosicao: Integer;
begin
  Result := False;

  sFrase := RemoverAcentos(pFrase).ToLower;
  for nPosicao := 1 to Length(sFrase) do
  begin
    if MatchStr(sFrase[nPosicao],[',','.','!', '"','?',':', '-', '(', ')', ';', ' ']) then
      Continue;

    sFraseFormatada := sFraseFormatada + sFrase[nPosicao];
  end;

  sFraseInvertida := InverterFrase(sFraseFormatada);
  if sFraseFormatada = sFraseInvertida then
    Result := True;
end;

function PegarFrasesPalindromos(const aListaFrases: TArray<String>): TArray<String>;
var
  nPosicaoFrase: Integer;
  nPosicaoFrasePalindromo: Integer;
begin
  nPosicaoFrasePalindromo := 0;
  for nPosicaoFrase := 0 to Pred(Length(aListaFrases)) do
  begin
    if ValidarPalindromo(aListaFrases[nPosicaoFrase]) then
    begin
      Inc(nPosicaoFrasePalindromo);
      SetLength(result, nPosicaoFrasePalindromo);
      Result[Pred(nPosicaoFrasePalindromo)] := aListaFrases[nPosicaoFrase];
    end;
  end;
end;

procedure Main;
var
  sFrase: String;
  aListaFrases: TArray<String>;
  aListaFrasesPalindromo: TArray<String>;
  bSairDoPrograma: Boolean;
begin
  Writeln('Informe uma frase e tecle ''Enter'' para continuar ou digite ''Sair'' para ' +
            'descobrir se há alguma frase Palíndromo.');
  repeat
    Write('Informe uma frase: ');
    Readln(sFrase);

    bSairDoPrograma := sFrase.ToLower = 'sair';
    if not bSairDoPrograma then
    begin
      SetLength(aListaFrases, Succ(Length(aListaFrases)));
      aListaFrases[Pred(Length(aListaFrases))] := sFrase;
    end;
  until bSairDoPrograma;

  aListaFrasesPalindromo := PegarFrasesPalindromos(aListaFrases);
  Writeln('======== Palíndromos ========');
  for sFrase in aListaFrasesPalindromo do
    Writeln(sFrase);
  Writeln('=============================');
  Readln;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  Main;
end.
