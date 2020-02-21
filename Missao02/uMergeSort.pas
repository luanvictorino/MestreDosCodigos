unit uMergeSort;

interface

  type
    TMergeSort = class
      function ConverterListaEmInteiro(const sListaNumeros: String): TArray<Integer>;
      function MergeSort(const pLista: TArray<Integer>): TArray<Integer>;
    end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Math;

function TMergeSort.ConverterListaEmInteiro(const sListaNumeros: String): TArray<Integer>;
var
  aListaNumerosStr: TArray<String>;
  i: Integer;
begin
  aListaNumerosStr := sListaNumeros.Split([','], TStringSplitOptions.ExcludeEmpty);

  SetLength(result, Length(aListaNumerosStr));
  for i := Low(aListaNumerosStr) to High(aListaNumerosStr) do
    result[i] := aListaNumerosStr[i].ToInteger;
end;

function TMergeSort.MergeSort(const pLista: TArray<Integer>): TArray<Integer>;
var
  nMeio: Integer;
  nIndice: Integer;
  nEsquerda: Integer;
  nDireita: Integer;
  aListaEsquerda: TArray<Integer>;
  aListaDireita: TArray<Integer>;
  aListaOrdenada: TArray<Integer>;
begin
  if (Length(pLista) <= 1) then
    Exit(pLista);

  nMeio := Ceil(Length(pLista)/2);

  SetLength(aListaOrdenada,Length(pLista));
  SetLength(aListaEsquerda,nMeio);
  SetLength(aListaDireita,(Length(pLista)-nMeio));

  for nIndice := 0 to Pred(nMeio) do
    aListaEsquerda[nIndice] := pLista[nIndice];

  for nIndice := nMeio  to Pred(Length(pLista)) do
    aListaDireita[(nIndice-nMeio)] := pLista[nIndice];

  aListaEsquerda := MergeSort(aListaEsquerda);
  aListaDireita := MergeSort(aListaDireita);

  nIndice := ZeroValue;
  nEsquerda := ZeroValue;
  nDireita := ZeroValue;

  while (Length(aListaEsquerda) <> nEsquerda) and (Length(aListaDireita) <> nDireita) do
  begin
    if (aListaEsquerda[nEsquerda] <= aListaDireita[nDireita]) then
    begin
      aListaOrdenada[nIndice] := aListaEsquerda[nEsquerda];
      Inc(nEsquerda);
    end
    else
    begin
      aListaOrdenada[nIndice] := aListaDireita[nDireita];
      Inc(nDireita);
    end;
    Inc(nIndice);
  end;

  while (Length(aListaEsquerda) <> nEsquerda) do
  begin
    aListaOrdenada[nIndice] := aListaEsquerda[nEsquerda];
    Inc(nEsquerda);
    Inc(nIndice);
  end;

  while (Length(aListaDireita) <> nDireita) do
  begin
    aListaOrdenada[nIndice] := aListaDireita[nDireita];
    Inc(nDireita);
    Inc(nIndice);
  end;
  Result := aListaOrdenada;
end;

end.
