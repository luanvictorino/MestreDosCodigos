//////////////////////////////////////////////////////////////
//   Autor: Luan Victorino                                  //
//    Data: 06/12/2019                                      //
//  Missão: Escreva uma aplicação console que receba uma    //
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
const
  sEspaco = ' ';
var
  nPosicao: Integer;
  sNome: String;
  sNomeConvertido: String;
  aListaConvertida: TArray<String>;
begin
  SetLength(aListaConvertida, nTamanhoLista);

  for nPosicao := 0 to Pred(nTamanhoLista) do
  begin
      aLista[nPosicao] := aLista[nPosicao].ToLower;
      for sNome in SplitString(aLista[nPosicao], sEspaco) do
      begin
        sNomeConvertido := ConverterNomes(sNome);
        aListaConvertida[nPosicao] := aListaConvertida[nPosicao] + sNomeConvertido + ' ';
      end;
      aLista[nPosicao] := aListaConvertida[nPosicao];
  end;
end;

procedure main;
var
  sNome: String;
  aListaNomes: TArray<String>;
  nTamanhoLista: Integer;
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

  SepararNomes(aListaNomes, Succ(nTamanhoLista));
  Writeln('========== Lista ==========');
  for sNome in aListaNomes do
    Writeln(sNome);

  Readln;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
