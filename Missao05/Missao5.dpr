//////////////////////////////////////////////////////////////
//   Autor: Luan Victorino                                  //
//    Date: 06/12/2019                                      //
// Mission: Em uma aplicação console, construa um programa  //
//          que leia uma lista de frases. Apresente ao      //
//          usuário apenas as frases que formam um          //
//          palíndromo                                      //
//////////////////////////////////////////////////////////////
program Missao5;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.StrUtils;

function RemoverAcentos(sFrase: String): String;
type
  USAscii20127 = type AnsiString(20127);
begin
  Result := string(USAscii20127(sFrase));
end;

function VerificarSeEhPalindromo(sFrase: String): boolean;
var
  sFraseInvertida: String;
  sFraseFormatada: String;
  i: Integer;
begin
  Result := False;

  sFrase := RemoverAcentos(sFrase).ToLower;
  sFrase := StringReplace(sFrase, ' ', EmptyStr, [rfReplaceAll]);
  for i := Length(sFrase) downto 1 do
  begin
    if MatchStr(sFrase[i],[',','.','!', '"','?',':', '-', '(', ')', ';']) then
      continue;

    sFraseInvertida := sFraseInvertida + sFrase[i];
  end;

  for i := 1 to Length(sFrase) do
  begin
    if MatchStr(sFrase[i],[',','.','!', '"','?',':', '-', '(', ')', ';']) then
      Continue;

    sFraseFormatada := sFraseFormatada + sFrase[i];
  end;

  if sFraseFormatada = sFraseInvertida then
    Result := True;
end;

function PegarFrasesPalindromo(var aListaFrases: TArray<String>): TArray<String>;
var
  sFrase: String;
  nTamanhoLista: Integer;
  aListaPalindromos: TArray<String>;
  i: Integer;
  j: Integer;
begin
  nTamanhoLista:= Length(aListaFrases);
  sFrase := '';
  j := 0;
  SetLength(result, nTamanhoLista);

  for i := 0 to nTamanhoLista do
  begin
    for sFrase in SplitString(aListaFrases[i], '') do
    begin
      if VerificarSeEhPalindromo(sFrase) then
      begin
        SetLength(aListaPalindromos, Succ(Length(aListaPalindromos)));
        aListaPalindromos[j] := aListaFrases[i];
        result[j] := aListaPalindromos[j];
        j := j+1;
      end
      else
      begin
        result[j] := EmptyStr;
      end;
    end;
  end;
end;

procedure main;
var
  sFrase: String;
  aListaFrases: TArray<String>;
  aListaFrasesPalindromo: TArray<String>;
  nTamanhoLista: Integer;
  i: Integer;
begin
  repeat
    Write('Digite uma lista de frases ou digite ''sair'' para sair: ');
    readln(sFrase);

    if sFrase = 'sair' then
      Break;

    SetLength(aListaFrases, Succ(Length(aListaFrases)));
    nTamanhoLista := Length(aListaFrases)-1;
    aListaFrases[nTamanhoLista] := sFrase;
  until False;

  nTamanhoLista := 0;
  Writeln('======== Palindromos ========');
  SetLength(aListaFrasesPalindromo, nTamanhoLista);
  aListaFrasesPalindromo := PegarFrasesPalindromo(aListaFrases);
  nTamanhoLista := Length(aListaFrasesPalindromo)-1;

  for i := 0 to nTamanhoLista do
  begin
    Writeln(aListaFrasesPalindromo[i]);
  end;
  readln;
end;

begin
  main;
end.
