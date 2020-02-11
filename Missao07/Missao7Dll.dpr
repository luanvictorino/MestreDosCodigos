library Missao7Dll;

uses
  System.SysUtils,
  System.Classes;

{$R *.res}

function NumeroExtensoCentena(sNumero: String; nTamanhoNumero: Integer): String;
var
  aNumerosUnidades: TArray<String>;
  aNumerosDez: TArray<String>;
  aNumerosDezenas: TArray<String>;
  aNumerosCentenas: TArray<String>;
  sNumeroPorExtenso: String;
begin
  aNumerosUnidades := ['um', 'dois', 'três', 'quatro', 'cinco', 'seis', 'sete', 'oito', 'nove'];
  aNumerosDez := ['onze', 'doze', 'treze', 'quatorze', 'quinze', 'dezesseis', 'dezessete',
                  'dezoito', 'dezenove'];
  aNumerosDezenas := ['dez', 'vinte', 'trinta', 'quarenta', 'cinquenta', 'sescenta',
                      'setenta', 'oitenta', 'noventa'];
  aNumerosCentenas := ['cento', 'duzentos', 'trezentos', 'quatroscentos', 'quinhentos',
                       'seiscentos', 'setescentos', 'oitoscentos', 'novescentos'];

  nTamanhoNumero := Length(sNumero);
  if sNumero[nTamanhoNumero] = '0' then
    sNumeroPorExtenso := ''
  else
    sNumeroPorExtenso := aNumerosUnidades[StrToInt(sNumero[nTamanhoNumero])-1];

  nTamanhoNumero := nTamanhoNumero-1;
  if nTamanhoNumero = 0 then
  begin
    Result := sNumeroPorExtenso;
    Exit;
  end
  else
  begin
    if sNumero[nTamanhoNumero] = '0' then
    begin
      sNumeroPorExtenso := sNumeroPorExtenso;
    end
    else
    begin
      if (sNumero[nTamanhoNumero] = '1') and sNumeroPorExtenso.IsEmpty then
      begin
        sNumeroPorExtenso := aNumerosDezenas[StrToInt(sNumero[nTamanhoNumero])-1];
      end
      else if (sNumero[nTamanhoNumero] = '1') and (sNumeroPorExtenso <> '') then
      begin
        sNumeroPorExtenso := aNumerosDez[StrToInt(sNumero[nTamanhoNumero+1])-1];
      end
      else
      begin
        if sNumeroPorExtenso.IsEmpty then
          sNumeroPorExtenso := aNumerosDezenas[StrToInt(sNumero[nTamanhoNumero])-1]
        else
          sNumeroPorExtenso := aNumerosDezenas[StrToInt(sNumero[nTamanhoNumero])-1] +
                               ' e ' + sNumeroPorExtenso;
      end;
    end;
  end;

  nTamanhoNumero := nTamanhoNumero-1;
  if nTamanhoNumero <=0 then
  begin
    Result := sNumeroPorExtenso;
  end
  else
  begin
    if sNumero[nTamanhoNumero] = '0' then
    begin
      sNumeroPorExtenso := '' + sNumeroPorExtenso;
    end
    else
    begin
      if sNumeroPorExtenso.IsEmpty then
      begin
        sNumeroPorExtenso := aNumerosCentenas[StrToInt(sNumero[nTamanhoNumero])-1];
        if sNumero = '100' then
          sNumeroPorExtenso := 'cem';
      end
      else
        sNumeroPorExtenso := aNumerosCentenas[StrToInt(sNumero[nTamanhoNumero])-1] +
                             ' e ' + sNumeroPorExtenso;
    end;
  end;
  Result := sNumeroPorExtenso;
end;

function NumeroExtensoMilhar(sNumero: String; nTamanhoNumero: Integer): String;
var
  sBilhao: String;
  sMilhao: String;
  sMilhar: String;
  sCentena: String;
  sPlural: String;
  i: Integer;
  sNumeroExtenso: String;
begin
  for i := 1 to nTamanhoNumero do
  begin
  if (nTamanhoNumero-i) >= 9 then
    sBilhao := sBilhao + sNumero[i]
  else if((nTamanhoNumero-i) >= 6) and ((nTamanhoNumero-i) < 9) then
    sMilhao := sMilhao + sNumero[i]
  else if ((nTamanhoNumero-i) >= 3) and ((nTamanhoNumero-i) < 6) then
    sMilhar := sMilhar + sNumero[i]
  else
    sCentena := sCentena + sNumero[i];
  end;

  if sCentena = '000' then
    sNumeroExtenso := NumeroExtensoCentena(sMilhar, nTamanhoNumero) + ' mil '
  else if sMilhar = '000' then
    sNumeroExtenso := NumeroExtensoCentena(sCentena, nTamanhoNumero)
  else
    sNumeroExtenso := NumeroExtensoCentena(sMilhar, nTamanhoNumero) + ' mil, ' +
              NumeroExtensoCentena(sCentena, nTamanhoNumero);

  if sNumeroExtenso = ' mil ' then
    sNumeroExtenso := '';

  if nTamanhoNumero > 6 then
  begin
    if sMilhao = '1' then
    begin
      sPlural := ' milhão, ';
      if sNumeroExtenso.IsEmpty then
        sPlural := ' milhão';
    end
    else
    begin
      sPlural := ' milhões, ';
      if sNumeroExtenso.IsEmpty then
        sPlural := ' milhões';
    end;
    sNumeroExtenso := NumeroExtensoCentena(sMilhao, nTamanhoNumero) + sPlural + sNumeroExtenso;
  end;

  if (sMilhao = '000') and (sBilhao = '1') then
  begin
    Result := NumeroExtensoCentena(sBilhao, nTamanhoNumero) + ' bilhão';
    Exit;
  end
  else if sMilhao = '000' then
  begin
    Result := NumeroExtensoCentena(sBilhao, nTamanhoNumero) + ' bilhões';
    Exit;
  end;

  if nTamanhoNumero > 9 then
  begin
    if sBilhao = '1' then
    begin
      sPlural := ' bilhão, ';
      if sNumeroExtenso.IsEmpty then
        sPlural := ' bilhão';
    end
    else
    begin
      sPlural := ' bilhões, ';
      if sNumeroExtenso.IsEmpty then
        sPlural := ' bilhões';
    end;

    sNumeroExtenso :=  NumeroExtensoCentena(sBilhao, nTamanhoNumero) + sPlural + sNumeroExtenso;
    Result := sNumeroExtenso;
    Exit;
  end;

  Result := sNumeroExtenso;
end;

function ExtrairNumeroInteiro(sNumero: String): String;
var
  nTamanhoNumero: Integer;
begin
  nTamanhoNumero := Pos(',',(sNumero))-1;
  sNumero := copy(sNumero, 1, nTamanhoNumero);
  Result := sNumero;
end;

function ExtrairDecimais(sNumero: String): String;
var
  sDecimais: String;
  bDecimal: Boolean;
begin
  sNumero := Result;
  sDecimais := copy(sNumero,pos(',',sNumero)+ 1);
  bDecimal := Length(sDecimais) < 2;

  if Length(sDecimais) = 1 then
    sDecimais := '0'+sDecimais;

  if (sDecimais = '00') or (sDecimais = '') then
  begin
    sDecimais := ''
  end
  else
  begin
    if bDecimal then
      sDecimais := ' e ' +  NumeroExtensoCentena(sDecimais, 2) + ' décimos'
    else
      sDecimais := ' e ' +  NumeroExtensoCentena(sDecimais, 2) + ' centésimos';
  end;
  Result := sDecimais;
end;

function NumeroPorExtenso(sNumero: String): String;
var
  sDecimais: String;
  nTamanhoNumero: Integer;
  sNumeroPorExtenso: String;
  i: Integer;
  sNumeroInvertido: String;
  sNumeroPronto: String;
begin
  sDecimais := sNumero;
  sNumero := ExtrairNumeroInteiro(sNumero);
  nTamanhoNumero := Length(sNumero);
  if nTamanhoNumero > 3 then
  begin
    sNumeroPorExtenso := NumeroExtensoMilhar(sNumero, nTamanhoNumero)
  end
  else
  begin
    sNumeroPorExtenso := NumeroExtensoCentena(sNumero, nTamanhoNumero);
    if (nTamanhoNumero = 1) and (sNumero = '0') then
    begin
      sNumeroPorExtenso := 'zero';
    end;
  end;

  sDecimais := ExtrairDecimais(sNumero);
  if not sDecimais.IsEmpty then
  begin
    sNumeroPorExtenso := sNumeroPorExtenso + sDecimais;
  end
  else
  begin
    nTamanhoNumero := Length(sNumeroPorExtenso);
    for i := nTamanhoNumero downto 1 do
      sNumeroInvertido := sNumeroInvertido + sNumeroPorExtenso[i];

    sNumeroPronto := StringReplace(sNumeroInvertido, ',', 'e ', []);
    sNumeroPorExtenso := '';
    for i := Succ(nTamanhoNumero) downto 1 do
      sNumeroPorExtenso := sNumeroPorExtenso + sNumeroPronto[i];
  end;

  Result := sNumeroPorExtenso + '.';
end;

exports
  NumeroExtensoCentena,
  NumeroExtensoMilhar,
  ExtrairNumeroInteiro,
  ExtrairDecimais,
  NumeroPorExtenso;

begin
end.
