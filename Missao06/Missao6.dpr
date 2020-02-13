//////////////////////////////////////////////////////////////
//   Autor: Luan Victorino                                  //
//    Data: 09/12/2019                                      //
//  Miss�o: Escreva uma DLL que execute os seguintes        //
//          c�lculos geom�tricos: �rea de um tri�ngulo,     //
//          �rea do c�rculo e �rea do ret�ngulo/quadrado.   //
//          Construa um programa console que carregue a DLL //
//          de forma din�mica. Neste programa, o usu�rio    //
//          deve entrar com o tipo de c�lculo que deseja    //
//          executar e os valores referentes ao c�lculo. No //
//          final da execu��o, o resultado deve ser         //
//          apresentado em tela.                            //
//////////////////////////////////////////////////////////////
program Missao6;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.StrUtils,
  Winapi.Windows,
  System.Math;

  const
    sNomeBiblioteca = 'Missao6Dll.dll';

  type
    TCalcularAreaTriangulo = function(nBase, nAltura: Real): Real; stdcall;
    TCalcularAreaQuadradoRetangulo = function(nBase, nAltura: Real): Real; stdcall;
    TCalcularAreaCirculo = function(nRaio: Real): Real; stdcall;

procedure MostrarAreaTriangulo(pHandleDll: THandle);
var
  oCalcularAreaTriangulo: TCalcularAreaTriangulo;
  nBase: Real;
  nAltura: Real;
  nArea: Real;
  sValor: String;
begin
  Writeln('-----Calcular �rea de um tri�ngulo-----');
  repeat
    Writeln(EmptyStr);
    Write('Informe a base: ');
    Readln(sValor);
    nBase := StrToFloatDef(sValor, ZeroValue);

    Write('Informe a altura: ');
    Readln(sValor);
    nAltura := StrToFloatDef(sValor, ZeroValue);

    if ((nBase > ZeroValue) and (nAltura > ZeroValue)) then
      break;

    Writeln(EmptyStr);
    Writeln('Informe um valor v�lido');
  until False;

  @oCalcularAreaTriangulo := GetProcAddress(pHandleDll, 'CalcularAreaTriangulo');
  if not Assigned(oCalcularAreaTriangulo) then
    raise Exception.Create('Fun��o n�o encontrada!!');

  nArea := oCalcularAreaTriangulo(nBase, nAltura);
  Writeln('A area do Tri�ngulo eh: '+ FormatFloat('#0.00',nArea));
end;

procedure MostrarAreaCirculo(pHandleDll: THandle);
var
  oCalcularAreaCirculo: TCalcularAreaCirculo;
  nRaio: Real;
  nArea: Real;
  sValor: String;
begin
  Writeln('-----Calcular �rea de um c�rculo-----');
  repeat
    Writeln(EmptyStr);
    Write('Informe o raio do c�rculo: ');
    Readln(sValor);
    nRaio := StrToFloatDef(sValor, ZeroValue);

    if (nRaio > ZeroValue) then
      break;

    Writeln(EmptyStr);
    Writeln('Informe um valor v�lido');
  until False;

  @oCalcularAreaCirculo := GetProcAddress(pHandleDll, 'CalcularAreaCirculo');
  if not Assigned(oCalcularAreaCirculo) then
    raise Exception.Create('Fun��o n�o encontrada!!');

  nArea := oCalcularAreaCirculo(nRaio);
  Writeln('A �rea do circulo eh: '+ FormatFloat('#0.00',nArea));
end;

procedure MostrarAreaQuadradoRetangulo(pHandleDll: THandle);
var
  oCalcularAreaQuadradoRetangulo: TCalcularAreaQuadradoRetangulo;
  nBase: Real;
  nAltura: Real;
  nArea: Real;
  sValor: String;
begin
  Writeln('-----Calcular �rea de um quadrado/ret�ngulo-----');
  repeat
    Writeln(EmptyStr);
    Write('Informe a base: ');
    Readln(sValor);
    nBase := StrToFloatDef(sValor, ZeroValue);

    Write('Informe a altura: ');
    Readln(sValor);
    nAltura := StrToFloatDef(sValor, ZeroValue);

    if((nBase > ZeroValue) and (nAltura > ZeroValue)) then
      break;

    Writeln(EmptyStr);
    Writeln('Informe um valor v�lido');
  until False;

  @oCalcularAreaQuadradoRetangulo := GetProcAddress(pHandleDll, 'CalcularAreaQuadradoRetangulo');
  if not Assigned(oCalcularAreaQuadradoRetangulo) then
    raise Exception.Create('Fun��o n�o encontrada!!');

  nArea := oCalcularAreaQuadradoRetangulo(nBase, nAltura);
  Writeln('A �rea do quadrado/ret�ngulo �: '+FormatFloat('#0.00',nArea));
end;

procedure main;
var
  sOperacao: String;
  hDll: THandle;
begin
  repeat
    Writeln('�rea de um tri�ngulo          [1]');
    Writeln('�rea de um c�rculo            [2]');
    Writeln('�rea de um quadrado/ret�ngulo [3]');
    Writeln(EmptyStr);
    Write('Digite o n�mero relacionado a opera��o desejada: ');
    Readln(sOperacao);
    Writeln;

    if MatchStr(sOperacao,['1','2','3'])  then
      Break;

    Writeln('Digito inv�lido!! Tente novamente.');
    Writeln(EmptyStr);
  until False;

  hDll := LoadLibrary(sNomeBiblioteca);
  try
    if hDll = 0 then
      raise Exception.Create('Biblioteca n�o encontrada!!');

    case sOperacao.ToInteger of
      1: MostrarAreaTriangulo(hDll);
      2: MostrarAreaCirculo(hDll);
      3: MostrarAreaQuadradoRetangulo(hDll);
    end;
  finally
    FreeLibrary(hDll);
  end;
  Readln;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
