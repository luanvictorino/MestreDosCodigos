//////////////////////////////////////////////////////////////
//   Autor: Luan Victorino                                  //
//    Data: 05/12/2019                                      //
//  Miss�o: Em uma aplica��o console, construa um programa  //
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
  oMergeSort: TMergeSort;
  nNumero: Integer;
begin
  oMergeSort := TMergeSort.Create;
  try
    Write('Digite uma lista de n�meros separados por v�rgula: ');
    readln(sListaNumeros);

    aListaNumeros := oMergeSort.ConverterListaEmInteiro(sListaNumeros);
    aListaNumeros := oMergeSort.MergeSort(aListaNumeros);

    Write('A lista ordenada �');
    for nNumero in aListaNumeros do
      Write(', '+nNumero.ToString);
  finally
    oMergeSort.Free;
  end;

  Readln;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  Main;
end.
