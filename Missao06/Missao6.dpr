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
  System.StrUtils, Winapi.Windows;

  const
    sNomeBiblioteca = 'Missao6Dll.dll';

  type
    TCalcularAreaTriangulo = function(nBase, nAltura: Real): Real; stdcall;
    TCalcularAreaQuadradoRetangulo = function(nBase, nAltura: Real): Real; stdcall;
    TCalcularAreaCirculo = function(nRaio: Real): Real; stdcall;

procedure MostrarAreaTriangulo;
var
  hDll: THandle;
  oCalcularAreaTriangulo: TCalcularAreaTriangulo;
  nBase: Real;
  nAltura: Real;
  nArea: Real;
begin
  Writeln('-----Calcular �rea de um tri�ngulo-----');
  Writeln(EmptyStr);
  repeat
    Write('Informe a base: ');
    Readln(nBase);
    Write('Informe a altura: ');
    Readln(nAltura);

    if not(nBase <= 0) or (nAltura <= 0) then
      break;

    Writeln('O n�mero n�o pode ser menor ou igual a zero, informe um valor v�lido!');
  until False;

  hDll := LoadLibrary(sNomeBiblioteca);
  try
    if hDll = 0 then
      raise Exception.Create('Biblioteca n�o encontrada!!');

    @oCalcularAreaTriangulo := GetProcAddress(hDll, 'CalcularAreaTriangulo');
    if not Assigned(oCalcularAreaTriangulo) then
      raise Exception.Create('Fun��o n�o encontrada!!');

    nArea := oCalcularAreaTriangulo(nBase, nAltura);
    Writeln('A area do Tri�ngulo eh: '+ FormatFloat('#0.00',nArea));
  finally
    FreeLibrary(hDll);
  end;
end;

procedure MostrarAreaQuadradoRetangulo;
var
  hDll: THandle;
  oCalcularAreaQuadradoRetangulo: TCalcularAreaQuadradoRetangulo;
  nBase: Real;
  nAltura: Real;
  nArea: Real;
begin
  Writeln('-----Calcular �rea de um quadrado/ret�ngulo-----');
  Writeln(EmptyStr);
  repeat
    Write('Informe a base: ');
    Readln(nBase);
    Write('Informe a altura: ');
    Readln(nAltura);

    if not (nBase <= 0) or (nAltura <= 0) then
      break;

    Writeln('O n�mero n�o pode ser menor ou igual a zero, informe um valor v�lido!');
  until False;

  hDll := LoadLibrary(sNomeBiblioteca);
  try
    if hDll = 0 then
      raise Exception.Create('Biblioteca n�o encontrada!!');

    @oCalcularAreaQuadradoRetangulo := GetProcAddress(hDll, 'CalcularAreaQuadradoRetangulo');
    if not Assigned(oCalcularAreaQuadradoRetangulo) then
      raise Exception.Create('Fun��o n�o encontrada!!');

    nArea := oCalcularAreaQuadradoRetangulo(nBase, nAltura);
    Writeln('A �rea do quadrado/ret�ngulo �: '+FormatFloat('#0.00',nArea));
  finally
    FreeLibrary(hDll);
  end;
end;

procedure MostrarAreaCirculo;
var
  hDll: THandle;
  oCalcularAreaCirculo: TCalcularAreaCirculo;
  nRaio: Real;
  nArea: Real;
begin
  Writeln('-----Calcular �rea de um c�rculo-----');
  Writeln(EmptyStr);
  repeat
    Write('Informe o raio do c�rculo: ');
    Readln(nRaio);

    if not (nRaio <= 0) then
      break;

    Writeln('O raio n�o pode ser menor ou igual a zero, informe um valor v�lido');
  until False;

  hDll := LoadLibrary(sNomeBiblioteca);
  try
    if hDll = 0 then
      raise Exception.Create('Biblioteca n�o encontrada!!');

    @oCalcularAreaCirculo := GetProcAddress(hDll, 'CalcularAreaCirculo');
    if not Assigned(oCalcularAreaCirculo) then
      raise Exception.Create('Fun��o n�o encontrada!!');

    nArea := oCalcularAreaCirculo(nRaio);
    Writeln('A �rea do circulo eh: '+ FormatFloat('#0.00',nArea));
  finally
    FreeLibrary(hDll);
  end;
end;

procedure main;
var
  sOperacao: String;
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

  case sOperacao.ToInteger of
    1: MostrarAreaTriangulo;
    2: MostrarAreaCirculo;
    3: MostrarAreaQuadradoRetangulo;
  end;
  readln;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
