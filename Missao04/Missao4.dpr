//////////////////////////////////////////////////////////////
//  Autor: Luan Victorino                                   //
//    Date: 06/12/2019                                      //
// Mission: Escreva uma aplicação console que receba uma    //
//          lista de nomes completos (nome e sobrenome)     //
//          informados pelo usuário. Estes nomes deverão    //
//          ser convertidos para caixa-mista, ou seja,      //
//          as iniciais de cada nome devem ser maiúsculas.  //
//          Leve em consideração que as preposições (“de”,  //
//          “do”, “dos”, ”e”, etc.) devem ser convertidas   //
//          para minúsculas                                 //
//////////////////////////////////////////////////////////////
program Missao4;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.StrUtils;

function VerificarEhPreposicao(sNome: String): boolean;
begin
  Result := False;
  if MatchStr(sNome,['a','e','o','da','de','do','das','dos']) then
    Result := True;
end;

function ConverterNomes(sNome: String): String;
begin
  if not VerificarEhPreposicao(sNome) then
  begin
    result := string(copy(sNome[1],1)).ToUpper + string(copy(sNome,2)).ToLower;
    Exit;
  end;

  result := sNome;
end;

procedure SepararNomes(var aLista: TArray<String>; nTamanhoLista: Integer);
var
  i: Integer;
  sEspaço: String;
  sNome: String;
  sNomeConvertido: String;
  aListaConvertida: TArray<String>;
begin
  sEspaço := ' ';
  nTamanhoLista := Length(aLista);
  SetLength(aListaConvertida, nTamanhoLista);

  for i := 0 to nTamanhoLista-1 do
      aLista[i] := (aLista[i]).ToLower;

  for i := 0 to nTamanhoLista-1 do
  begin
    for sNome in SplitString(aLista[i], sEspaço) do
    begin
      sNomeConvertido := ConverterNomes(sNome);
      aListaConvertida[i] := aListaConvertida[i] + sNomeConvertido + ' ';
    end;
    aLista[i] := aListaConvertida[i];
  end;
end;

procedure main;
var
  sNome: String;
  aListaNomes: TArray<String>;
  nTamanhoLista: Integer;
  i: Integer;
begin
  nTamanhoLista := 0;
  repeat
    Write('Digite uma lista de nomes ou digite ''sair''para sair: ');
    readln(sNome);

    if sNome.ToLower = 'sair' then
      Break;

    SetLength(aListaNomes, Succ(Length(aListaNomes)));
    nTamanhoLista := Length(aListaNomes)-1;
    aListaNomes[nTamanhoLista] := sNome;
  until False;

  SepararNomes(aListaNomes, nTamanhoLista);

  Writeln('========== Lista ==========');
  for i := 0 to nTamanhoLista do
    Writeln(aListaNomes[i]);

  readln;
end;

begin
  main;
end.
