program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  aListaNumeros: array of Integer;
  aListaNumerosClone: array of Integer;

procedure SetarArray(nTamanhoArray: Integer);
begin
  SetLength(aListaNumeros, nTamanhoArray);
  SetLength(aListaNumerosClone, nTamanhoArray);
end;

procedure MergeSort(nInicio, nFim: Integer);
var
  nMeio: Integer;
  nIndice: Integer;
  nEsquerda: Integer;
  nDireita: Integer;
begin
  if nFim <= nInicio then
    Exit
  else
  begin
    nMeio := (nInicio + nFim) div 2;
    MergeSort(nInicio, nMeio);
    MergeSort(nMeio + 1, nFim);
    nEsquerda := nInicio;
    nDireita := nMeio + 1;
    for nIndice := nInicio to nFim do
    begin
      if (nEsquerda < nMeio + 1) and
         ((nDireita > nFim) or (aListaNumeros[nEsquerda] < aListaNumeros[nDireita])) then
      begin
        aListaNumerosClone[nIndice] := aListaNumeros[nEsquerda];
        inc(nEsquerda);
      end
      else
      begin
        aListaNumerosClone[nIndice] := aListaNumeros[nDireita];
        inc(nDireita);
      end;
    end;
    for nIndice := nInicio to nFim do
      aListaNumeros[nIndice] := aListaNumerosClone[nIndice];
  end;
end;

procedure main;
var
  nNumero: Integer;
  sNumero: String;
  nContador: Integer;
  nTamanhoArray: Integer;
  aListaNumerosMain: TArray<Integer>;
begin
  nContador := 1;
  Repeat
    Write('Informe um número ou ''fim'' para finalizar: ');
    Readln(sNumero);

    if sNumero = 'fim' then
      Break;

    aListaNumerosMain[nContador] := StrToInt(sNumero);
    nContador := nContador+1;
  Until False;

  nTamanhoArray := Length(aListaNumerosMain);
  SetarArray(nTamanhoArray);
  MergeSort(1, nTamanhoArray);

  for nNumero in aListaNumeros do
    Writeln(nNumero);

  readln;
end;

begin
  main;
  Readln;
end.
