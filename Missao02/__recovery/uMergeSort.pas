unit uMergeSort;

interface

  type
    TMergeSort = class
      function RetornaListaInteiro(sListaNumeros: String): TArray<Integer>;
      function MergeSort(aArrayPrincipal: TArray<Integer>;
        nInicio: Integer; nFim: Integer): TArray<Integer>;
      function ListaComDoisValores(aListaNumeros: TArray<Integer>): TArray<Integer>;
    end;

implementation

uses
  System.SysUtils,
  System.StrUtils;

function TMergeSort.ListaComDoisValores(aListaNumeros: TArray<Integer>): TArray<Integer>;
var
  nTroca: Integer;
begin
  if aListaNumeros[1] < aListaNumeros[0] then
  begin
    nTroca:= aListaNumeros[0];
    aListaNumeros[0]:= aListaNumeros[1];
    aListaNumeros[1]:= nTroca;
  end;

  Result := aListaNumeros;
end;

function TMergeSort.RetornaListaInteiro(sListaNumeros: String): TArray<Integer>;
var
  aListaNumerosStr: TArray<String>;
  i: Integer;
begin
  aListaNumerosStr := SplitString(sListaNumeros, ',');

  SetLength(result, Length(aListaNumerosStr));
  for i := 0 to Pred(Length(aListaNumerosStr)) do
    result[i] := aListaNumerosStr[i].ToInteger;
end;

function TMergeSort.MergeSort(aArrayPrincipal: TArray<Integer>;
  nInicio: Integer; nFim: Integer): TArray<Integer>;
var
  nContadorEsquerda,nContadorDireita,nContadorPrincipal,nMeio,b, a: Integer;
  aEsquerda,aDireita,aArrayClone: TArray<Integer>;
begin
  nMeio := (nFim+nInicio) div 2;

  if length(aArrayPrincipal) = 2 then
  begin
    aArrayClone := ListaComDoisValores(aArrayPrincipal);
  end
  else
  begin
    if length(aArrayPrincipal) = 1 then
    begin
      aArrayClone := aArrayPrincipal;
    end
    else
    begin
      aEsquerda:= Copy(aArrayPrincipal,nInicio,nMeio);
      aDireita := Copy(aArrayPrincipal,nMeio,nFim);
      aEsquerda := MergeSort(aEsquerda,0,high(aEsquerda));
      aDireita := MergeSort(aDireita,0,high(aDireita));
      nContadorEsquerda := 0; nContadorDireita:= 0; a:= 0; b:= 0;
      for nContadorPrincipal := 0 to length(aArrayPrincipal) do
      begin
        if aEsquerda[nContadorEsquerda] < aDireita[nContadorDireita] then
        begin
          aArrayPrincipal[nContadorPrincipal]:= aEsquerda[nContadorEsquerda];
          nContadorEsquerda:= nContadorEsquerda + 1;
        end
        else
        begin
          aArrayPrincipal[nContadorPrincipal]:= aDireita[nContadorDireita];
          nContadorDireita := nContadorDireita + 1;
        end;

        if (nContadorEsquerda > length(aEsquerda) - 1) then
        begin
          a:= 1;
          b:= nContadorPrincipal;
          break;
        end;
        if (nContadorDireita > length(aDireita) - 1) then
        begin
          a:= 2;
          b:= nContadorPrincipal;
          break;
        end;
      end;

      if a <> 0 then
      begin
        if a = 1 then
        begin
          for nContadorPrincipal:= nContadorDireita to length(aDireita)-1 do
          begin
            b:= b + 1;
            aArrayPrincipal[b]:= aDireita[nContadorPrincipal];
          end
        end
        else
        begin
          if a = 2 then
          begin
            for nContadorPrincipal := nContadorEsquerda to length(aEsquerda)-1 do
            begin
              b:= b + 1;
              aArrayPrincipal[b]:= aEsquerda[nContadorPrincipal];
            end;
          end;
        end;
        aArrayClone := aArrayPrincipal;
      end;
    end;
  end;

  result:= aArrayClone;
end;

end.
