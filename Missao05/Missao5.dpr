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
  System.StrUtils;

function RemoverAcentos(sFrase: String): String;
type
  USAscii20127 = type AnsiString(20127);
begin
  Result := string(USAscii20127(sFrase));
end;

function ValidarPalindromo(sFrase: String): boolean;
var
  sFraseInvertida: String;
  sFraseFormatada: String;
  nIndice: Integer;
begin
  Result := False;

  sFrase := RemoverAcentos(sFrase).ToLower;
  sFrase := StringReplace(sFrase, ' ', EmptyStr, [rfReplaceAll]);
  for nIndice := Length(sFrase) downto 1 do
  begin
    if MatchStr(sFrase[nIndice],[',','.','!', '"','?',':', '-', '(', ')', ';']) then
      continue;

    sFraseInvertida := sFraseInvertida + sFrase[nIndice];
  end;

  for nIndice := 1 to Length(sFrase) do
  begin
    if MatchStr(sFrase[nIndice],[',','.','!', '"','?',':', '-', '(', ')', ';']) then
      Continue;

    sFraseFormatada := sFraseFormatada + sFrase[nIndice];
  end;

  if sFraseFormatada = sFraseInvertida then
    Result := True;
end;

function PegarFrasesPalindromos(var aListaFrases: TArray<String>): TArray<String>;
var
  sFrase: String;
  nTamanhoLista: Integer;
  aListaPalindromos: TArray<String>;
  nIndiceFrase: Integer;
  nIndicePalindromo: Integer;
begin
  nTamanhoLista:= Length(aListaFrases);
  sFrase := '';
  nIndicePalindromo := 0;
  SetLength(result, nTamanhoLista);

  for nIndiceFrase := 0 to Pred(nTamanhoLista) do
  begin
    for sFrase in SplitString(aListaFrases[nIndiceFrase], '') do
    begin
      if ValidarPalindromo(sFrase) then
      begin
        SetLength(aListaPalindromos, Succ(Length(aListaPalindromos)));
        aListaPalindromos[nIndicePalindromo] := aListaFrases[nIndiceFrase];
        Result[nIndicePalindromo] := aListaPalindromos[nIndicePalindromo];
        nIndicePalindromo := Succ(nIndicePalindromo);
      end
      else
      begin
        result[nIndicePalindromo] := EmptyStr;
      end;
    end;
  end;
end;

procedure Main;
var
  sFrase: String;
  aListaFrases: TArray<String>;
  aListaFrasesPalindromo: TArray<String>;
  nTamanhoLista: Integer;
  nIndice: Integer;
begin
  repeat
    Write('Digite uma lista de frases ou digite ''sair'' para sair: ');
    readln(sFrase);

    if sFrase.ToLower = 'sair' then
      Break;

    SetLength(aListaFrases, Succ(Length(aListaFrases)));
    nTamanhoLista := Length(aListaFrases)-1;
    aListaFrases[nTamanhoLista] := sFrase;
  until False;

  nTamanhoLista := 0;
  SetLength(aListaFrasesPalindromo, nTamanhoLista);
  aListaFrasesPalindromo := PegarFrasesPalindromos(aListaFrases);
  nTamanhoLista := Pred(Length(aListaFrasesPalindromo));

  Writeln('======== Palindromos ========');
  for nIndice := 0 to nTamanhoLista do
  begin
    Writeln(aListaFrasesPalindromo[nIndice]);
  end;
  readln;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  Main;
end.
