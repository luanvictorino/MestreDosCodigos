/// /////////////////////////////////////////////////
// Autor: Luan Victorino                           //
// Data: 19/12/2019                                //
// Miss�o: Em uma aplica��o console, crie um tipo  //
// enumerado que represente os continentes.        //
// Construa um Record Helper para este tipo com os //
// seguintes m�todos:                              //
// AsLabel: com uma descri��o amig�vel ao usu�rio; //
// AsString: com o nome do Enum;                   //
// AsByte: com a representa��o num�rica do Enum;   //
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
      Result := '�frica';
    cAntartica:
      Result := 'Ant�rtica';
    cAmerica:
      Result := 'Am�rica';
    cAsia:
      Result := '�sia';
    cEuropa:
      Result := 'Europa';
    cOceania:
      Result := 'Oc�ania';
    else
      raise Exception.Create('Enum n�o referenciado no AsLabel');
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
  Writeln('Descri��o: ' + oContinente.AsLabel);
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
