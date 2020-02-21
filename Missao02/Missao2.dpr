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
  sListaOrdenada: String;
begin
  oMergeSort := TMergeSort.Create;
  Writeln('Informe uma lista de n�meros separados por v�rgula em seguida ' +
          'tecle''Enter'' para aplicar o algoritmo merge-sort. ');
  try
    Write('Lista de n�meros: ');
    Readln(sListaNumeros);

    aListaNumeros := oMergeSort.ConverterListaEmInteiro(sListaNumeros);
    aListaNumeros := oMergeSort.MergeSort(aListaNumeros);

    Write('A lista ordenada �: ');

    for nNumero in aListaNumeros do
      sListaOrdenada := (sListaOrdenada + ', ' + nNumero.ToString);

    Delete(sListaOrdenada, 1, 1);
    Write(sListaOrdenada);
    Readln;
  finally
    oMergeSort.Free;
  end;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  Main;
end.
