//////////////////////////////////////////////////////////////
//  Autor: Luan Victorino                                   //
//    Date: 05/12/2019                                      //
// Mission: Em uma aplicação console, construa um programa  //
//          que leia uma lista de números informada pelo    //
//          usuário. Em seguida, através do algoritmo       //
//          merge-sort, faça a ordenação da lista e         //
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

  Write('Digite uma lista de números separados por vírgula: ');
  readln(sListaNumeros);

  aListaNumeros := oMergeSort.RetornaListaInteiro(sListaNumeros);
  aListaNumeros := oMergeSort.MergeSort(aListaNumeros, 0, High(aListaNumeros));

  Write('A lista ordenada é: ');
  for nContador := 0 to Length(aListaNumeros)-1 do
    Write(aListaNumeros[nContador]);

  readln;
end;

begin
  main;
end.
