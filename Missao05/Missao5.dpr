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

function RemoverAcentos(sFrase: String): String;
type
  USAscii20127 = type AnsiString(20127);
begin
  Result := string(USAscii20127(sFrase));
end;

function InverterFrase(sFrase: String): String;
var
  nPosicao: Integer;
begin
  for nPosicao := Length(sFrase) downto 1 do
    Result := Result + sFrase[nPosicao];
end;

function ValidarPalindromo(sFrase: String): boolean;
var
  sFraseInvertida: String;
  sFraseFormatada: String;
  nPosicao: Integer;
begin
  Result := False;

  sFrase := RemoverAcentos(sFrase).ToLower;
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

function PegarFrasesPalindromos(var aListaFrases: TArray<String>): TArray<String>;
var
  nPosicaoFrase: Integer;
begin
  for nPosicaoFrase := ZeroValue to Pred(Length(aListaFrases)) do
  begin
    if ValidarPalindromo(aListaFrases[nPosicaoFrase]) then
    begin
      SetLength(result, Succ(Length(result)));
      Result[Pred(Length(result))] := aListaFrases[nPosicaoFrase];
    end;
  end;
end;

procedure Main;
var
  sFrase: String;
  aListaFrases: TArray<String>;
  aListaFrasesPalindromo: TArray<String>;
begin
  repeat
    Write('Digite uma lista de frases ou digite ''sair'' para sair: ');
    readln(sFrase);

    if sFrase.ToLower = 'sair' then
      Break;

    SetLength(aListaFrases, Succ(Length(aListaFrases)));
    aListaFrases[Pred(Length(aListaFrases))] := sFrase;
  until False;

  aListaFrasesPalindromo := PegarFrasesPalindromos(aListaFrases);
  Writeln('======== Palindromos ========');
  for sFrase in aListaFrasesPalindromo do
    Writeln(sFrase);
  Writeln('=============================');
  Readln;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  Main;
end.
