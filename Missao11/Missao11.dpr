/// /////////////////////////////////////////////////
// Autor: Luan Victorino                           //
// Data: 19/12/2019                                //
// Missão: Em uma aplicação console, crie um tipo  //
// enumerado que represente os continentes.        //
// Construa um Record Helper para este tipo com os //
// seguintes métodos:                              //
// AsLabel: com uma descrição amigável ao usuário; //
// AsString: com o nome do Enum;                   //
// AsByte: com a representação numérica do Enum;   //
// Parse: que transforme um Byte no Enum.          //
/// /////////////////////////////////////////////////
program Missao11;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils, RTTI, TypInfo;

type
  TContinente = (cAfrica, cAntartica, cAmerica, cAsia, cEuropa, cOceania);

  TContinenteHelper = record helper for TContinente
    function AsLabel: String;
    function AsString: String;
    function AsByte: Byte;
    function Parse(const pContinente: byte): TContinente;
  end;

  { TContinentesHelper }

function TContinenteHelper.AsLabel: String;
begin
  case Self of
    cAfrica:
      Result := 'África';
    cAntartica:
      Result := 'Antártica';
    cAmerica:
      Result := 'América';
    cAsia:
      Result := 'Ásia';
    cEuropa:
      Result := 'Europa';
    cOceania:
      Result := 'Ocêania';
    else
      raise Exception.Create('Enum não referenciado no AsLabel');
  end
end;

function TContinenteHelper.AsString: String;
begin
  Result := GetEnumName(TypeInfo(TContinente), Integer(Self));
end;

function TContinenteHelper.AsByte: Byte;
begin
  Result := Ord(Self);
end;

function TContinenteHelper.Parse(const pContinente: Byte): TContinente;
begin
  Result := TContinente(pContinente);
end;

procedure Imprimir(const oContinente: TContinente);
begin
  Writeln('Descrição: ' + oContinente.AsLabel);
  Writeln('Nome do Enum: ' + oContinente.AsString);
  Writeln('Identificador: ' + oContinente.AsByte.ToString);
  Writeln('Parse: ' + oContinente.Parse(oContinente.AsByte).AsString);
  Writeln(EmptyStr);
end;

procedure main;
var
  oContinente: TContinente;
begin
  for oContinente := Low(TContinente) to High(TContinente) do
    Imprimir(oContinente);

  Readln;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
