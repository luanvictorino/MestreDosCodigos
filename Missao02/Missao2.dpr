//////////////////////////////////////////////////////////////
//  Autor: Luan Victorino                                   //
//    Date: 05/12/2019                                      //
// Mission: Em uma aplica��o console, construa um programa  //
//          que leia uma lista de n�meros informada pelo    //
//          usu�rio. Em seguida, atrav�s do algoritmo       //
//          merge-sort, fa�a a ordena��o da lista e         //
//          apresente o resultado.                          //
//////////////////////////////////////////////////////////////
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
