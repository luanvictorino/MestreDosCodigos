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

function ValidarPreposicao(const sNome: String): boolean;
begin
  Result := False;
  if MatchStr(sNome.ToLower,['a','e','o','da','de','do','das','dos']) then
    Result := True;
end;

function ConverterNomes(const sNomeCompleto: String): String;
const
  sESPACO = ' ';
var
  sNome: String;
  sNomeConvertido: String;
begin
  for sNome in SplitString(sNomeCompleto, sESPACO) do
  begin
    if not ValidarPreposicao(sNome) then
    begin
      sNomeConvertido := sNomeConvertido + sESPACO + string(sNome[1]).ToUpper +
                           string(copy(sNome,2)).ToLower;
      Continue;
    end;
    sNomeConvertido := sNomeConvertido + sESPACO + sNome.ToLower;
  end;

  Result := sNomeConvertido;
end;

function ConverterNomesParaCaixaMista(const aLista: TArray<String>;
  const nTamanhoLista: Integer): TArray<String>;
var
  nPosicao: Integer;
  aListaConvertida: TArray<String>;
begin
  SetLength(aListaConvertida, nTamanhoLista);
  for nPosicao := 0 to Pred(nTamanhoLista) do
    aListaConvertida[nPosicao] := ConverterNomes(aLista[nPosicao]);

  Result := aListaConvertida;
end;

function AdicionarNomeNaLista(const sNome: String): TArray<String>;
var
  nTamanhoLista: Integer;
begin
  SetLength(Result, Succ(Length(Result)));
  nTamanhoLista := Pred(Length(Result));
  Result[nTamanhoLista] := sNome;
end;

procedure main;
var
  sNome: String;
  aListaNomes: TArray<String>;
  bConverter: Boolean;
begin
  Writeln('Digite uma lista de nomes em seguida digite ''converter'' e tecle ' +
          '''enter'' para converter os nomes para caixa-mista. ');
  repeat
    Write('Informe um nome: ');
    Readln(sNome);

    bConverter := sNome.ToLower = 'converter';
    if not bConverter then
      aListaNomes := AdicionarNomeNaLista(sNome);
  until bConverter;

  aListaNomes := ConverterNomesParaCaixaMista(aListaNomes, Length(aListaNomes));
  Writeln('========== Lista ==========');
  for sNome in aListaNomes do
    Writeln(sNome);

  Writeln('===========================');
  Readln;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
