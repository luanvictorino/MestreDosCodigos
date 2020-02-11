//////////////////////////////////////////////////////////////
//   Autor: Luan Victorino                                  //
//    Data: 09/12/2019                                      //
//  Missão: Escreva uma DLL que execute os seguintes        //
//          cálculos geométricos: área de um triângulo,     //
//          área do círculo e área do retângulo/quadrado.   //
//          Construa um programa console que carregue a DLL //
//          de forma dinâmica. Neste programa, o usuário    //
//          deve entrar com o tipo de cálculo que deseja    //
//          executar e os valores referentes ao cálculo. No //
//          final da execução, o resultado deve ser         //
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
  Writeln('-----Calcular área de um triângulo-----');
  Writeln(EmptyStr);
  repeat
    Write('Informe a base: ');
    Readln(nBase);
    Write('Informe a altura: ');
    Readln(nAltura);

    if not(nBase <= 0) or (nAltura <= 0) then
      break;

    Writeln('O número não pode ser menor ou igual a zero, informe um valor válido!');
  until False;

  hDll := LoadLibrary(sNomeBiblioteca);
  try
    if hDll = 0 then
      raise Exception.Create('Biblioteca não encontrada!!');

    @oCalcularAreaTriangulo := GetProcAddress(hDll, 'CalcularAreaTriangulo');
    if not Assigned(oCalcularAreaTriangulo) then
      raise Exception.Create('Função não encontrada!!');

    nArea := oCalcularAreaTriangulo(nBase, nAltura);
    Writeln('A area do Triângulo eh: '+ FormatFloat('#0.00',nArea));
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
  Writeln('-----Calcular área de um quadrado/retângulo-----');
  Writeln(EmptyStr);
  repeat
    Write('Informe a base: ');
    Readln(nBase);
    Write('Informe a altura: ');
    Readln(nAltura);

    if not (nBase <= 0) or (nAltura <= 0) then
      break;

    Writeln('O número não pode ser menor ou igual a zero, informe um valor válido!');
  until False;

  hDll := LoadLibrary(sNomeBiblioteca);
  try
    if hDll = 0 then
      raise Exception.Create('Biblioteca não encontrada!!');

    @oCalcularAreaQuadradoRetangulo := GetProcAddress(hDll, 'CalcularAreaQuadradoRetangulo');
    if not Assigned(oCalcularAreaQuadradoRetangulo) then
      raise Exception.Create('Função não encontrada!!');

    nArea := oCalcularAreaQuadradoRetangulo(nBase, nAltura);
    Writeln('A área do quadrado/retângulo é: '+FormatFloat('#0.00',nArea));
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
  Writeln('-----Calcular área de um círculo-----');
  Writeln(EmptyStr);
  repeat
    Write('Informe o raio do círculo: ');
    Readln(nRaio);

    if not (nRaio <= 0) then
      break;

    Writeln('O raio não pode ser menor ou igual a zero, informe um valor válido');
  until False;

  hDll := LoadLibrary(sNomeBiblioteca);
  try
    if hDll = 0 then
      raise Exception.Create('Biblioteca não encontrada!!');

    @oCalcularAreaCirculo := GetProcAddress(hDll, 'CalcularAreaCirculo');
    if not Assigned(oCalcularAreaCirculo) then
      raise Exception.Create('Função não encontrada!!');

    nArea := oCalcularAreaCirculo(nRaio);
    Writeln('A área do circulo eh: '+ FormatFloat('#0.00',nArea));
  finally
    FreeLibrary(hDll);
  end;
end;

procedure main;
var
  sOperacao: String;
begin
  repeat
    Writeln('Área de um triângulo          [1]');
    Writeln('Área de um círculo            [2]');
    Writeln('Área de um quadrado/retângulo [3]');
    Writeln(EmptyStr);
    Write('Digite o número relacionado a operação desejada: ');
    Readln(sOperacao);
    Writeln;

    if MatchStr(sOperacao,['1','2','3'])  then
      Break;

    Writeln('Digito inválido!! Tente novamente.');
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
