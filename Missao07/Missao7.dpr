//////////////////////////////////////////////////////////////
//   Autor: Luan Victorino                                  //
//    Date: 11/12/2019                                      //
// Mission: Escreva uma DLL que transcreva um dado número   //
//          por extenso. Construa um programa console que   //
//          faça o carregamento estático da DLL. Neste      //
//          programa, o usuário poderá entrar com um número //
//          qualquer e, como saída, o programa deverá       //
//          transcrever o número por extenso em tela.       //
//////////////////////////////////////////////////////////////
program Missao7;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.StrUtils;

function NumeroExtensoCentena(sNumero: String; nTamanhoNumero: Integer): String;
  external 'Missao7Dll.dll';

function NumeroExtensoMilhar(sNumero: String; nTamanhoNumero: Integer): String;
  external 'Missao7Dll.dll';

function ExtrairNumeroInteiro(sNumero: String): String;
  external 'Missao7Dll.dll';

function ExtrairDecimais(sNumero: String): String;
  external 'Missao7Dll.dll';

function NumeroPorExtenso(sNumero: String): String;
  external 'Missao7Dll.dll';

function FormatarNumero(sNumero: String): String;
var
  nNumero: Real;
  sDecimais: String;
  nTamanhoNumero: Integer;
begin
  sNumero := StringReplace(sNumero, '.', ',', [rfReplaceAll]);
  sDecimais := copy(sNumero, pos(',', sNumero)+ 1, Length(sNumero));
  nNumero := StrToFloat(sNumero);
  sNumero := FormatFloat('0.00', nNumero);

  nTamanhoNumero := Length(sNumero);
  if Length(sDecimais) = 1 then
    sNumero := copy(sNumero, 1, nTamanhoNumero-1);

  Result := sNumero;
end;

procedure main;
var
  sNumero: String;
  sNumeroPorExtenso: String;
  nTamanhoNumero: Integer;
begin
  repeat
    Write('Digite um número inteiro ou digite ''sair'' para sair: ');
    Readln(sNumero);

    sNumero := sNumero.ToLower;
    if sNumero = 'sair' then
      Break;

    try
      sNumero := FormatarNumero(sNumero);
    except
      raise Exception.Create('Número inválido!');
    end;

    nTamanhoNumero := Length(sNumero);
    if nTamanhoNumero > 15 then
    begin
      Writeln('Digite um número menor do que 1 trilhão!!');
      Continue;
    end;

    sNumeroPorExtenso := NumeroPorExtenso(sNumero);
    Writeln('Número por extenso: '+sNumeroPorExtenso);
    Writeln;
  until False;
end;

begin
  main;
end.
