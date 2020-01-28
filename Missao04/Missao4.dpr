//////////////////////////////////////////////////////////////
//   Autor: Luan Victorino                                  //
//    Data: 06/12/2019                                      //
//  Miss�o: Escreva uma aplica��o console que receba uma    //
//          lista de nomes completos (nome e sobrenome)     //
//          informados pelo usu�rio. Estes nomes dever�o    //
//          ser convertidos para caixa-mista, ou seja,      //
//          as iniciais de cada nome devem ser mai�sculas.  //
//          Leve em considera��o que as preposi��es (�de�,  //
//          �do�, �dos�, �e�, etc.) devem ser convertidas   //
//          para min�sculas                                 //
//////////////////////////////////////////////////////////////
program Missao4;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.StrUtils;

function ValidarPreposicao(sNome: String): boolean;
begin
  Result := False;
  if MatchStr(sNome,['a','e','o','da','de','do','das','dos']) then
    Result := True;
end;

function ConverterNomes(sNome: String): String;
begin
  if not ValidarPreposicao(sNome) then
  begin
    Result := string(copy(sNome[1],1)).ToUpper + string(copy(sNome,2)).ToLower;
    Exit;
  end;

  Result := sNome;
end;

procedure SepararNomes(var aLista: TArray<String>; nTamanhoLista: Integer);
var
  nIndice: Integer;
  sEspa�o: String;
  sNome: String;
  sNomeConvertido: String;
  aListaConvertida: TArray<String>;
begin
  sEspa�o := ' ';
  nTamanhoLista := Length(aLista);
  SetLength(aListaConvertida, nTamanhoLista);

  for nIndice := 0 to Pred(nTamanhoLista) do
      aLista[nIndice] := (aLista[nIndice]).ToLower;

  for nIndice := 0 to Pred(nTamanhoLista) do
  begin
    for sNome in SplitString(aLista[nIndice], sEspa�o) do
    begin
      sNomeConvertido := ConverterNomes(sNome);
      aListaConvertida[nIndice] := aListaConvertida[nIndice] + sNomeConvertido + ' ';
    end;
    aLista[nIndice] := aListaConvertida[nIndice];
  end;
end;

procedure main;
var
  sNome: String;
  aListaNomes: TArray<String>;
  nTamanhoLista: Integer;
  nIndice: Integer;
begin
  nTamanhoLista := 0;
  repeat
    Write('Digite uma lista de nomes ou digite ''sair''para sair: ');
    readln(sNome);

    if sNome.ToLower = 'sair' then
      Break;

    SetLength(aListaNomes, Succ(Length(aListaNomes)));
    nTamanhoLista := Pred(Length(aListaNomes));
    aListaNomes[nTamanhoLista] := sNome;
  until False;

  SepararNomes(aListaNomes, nTamanhoLista);

  Writeln('========== Lista ==========');
  for nIndice := 0 to nTamanhoLista do
    Writeln(aListaNomes[nIndice]);

  Readln;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
