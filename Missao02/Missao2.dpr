program Missao2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uMergeSort in 'uMergeSort.pas';

procedure main;
var
  sListaNumeros: String;
  aListaNumeros: TArray<Integer>;
  nContador: Integer;
  oMergeSort: TMergeSort;
begin
  oMergeSort := TMergeSort.Create;

  Write('Digite uma lista de n�meros separados por v�rgula: ');
  readln(sListaNumeros);

  aListaNumeros := oMergeSort.RetornaListaInteiro(sListaNumeros);
  aListaNumeros := oMergeSort.MergeSort(aListaNumeros, 0, High(aListaNumeros));

  Write('A lista ordenada �: ');
  for nContador := 0 to Length(aListaNumeros)-1 do
    Write(aListaNumeros[nContador]);

  readln;
end;

begin
  main;
end.
