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
  System.StrUtils,
  Winapi.Windows,
  System.Math;

const
    sNomeBiblioteca = 'Missao6Dll.dll';

  type
    TCalcularAreaTriangulo = function(nBase, nAltura: Real): Real;
    TCalcularAreaQuadradoRetangulo = function(nBase, nAltura: Real): Real;
    TCalcularAreaCirculo = function(nRaio: Real): Real;

procedure PegarDadosTriangulo(var nBase: Real; var nAltura: Real);
var
  sValor: string;
  bValoresValidos: Boolean;
begin
  Writeln('-----Calcular área de um triângulo-----');
  repeat
    Writeln(EmptyStr);
    Write('Informe a base: ');
    Readln(sValor);
    nBase := StrToFloatDef(sValor, 0);

    Write('Informe a altura: ');
    Readln(sValor);
    nAltura := StrToFloatDef(sValor, ZeroValue);

    bValoresValidos := ((nBase > ZeroValue) and (nAltura > ZeroValue));
    if not bValoresValidos then
      Writeln('Informe um valor válido');
  until bValoresValidos;
end;

procedure MostrarAreaTriangulo(const pHandleDll: THandle);
var
  oCalcularAreaTriangulo: TCalcularAreaTriangulo;
  nBase: Real;
  nAltura: Real;
  nArea: Real;
begin
  PegarDadosTriangulo(nBase, nAltura);

  @oCalcularAreaTriangulo := GetProcAddress(pHandleDll, 'CalcularAreaTriangulo');
  if not Assigned(oCalcularAreaTriangulo) then
    raise Exception.Create('Função não encontrada!!');

  nArea := oCalcularAreaTriangulo(nBase, nAltura);
  Writeln('A area do Triângulo eh: '+ FormatFloat('#0.00',nArea));
end;

procedure PegarDadosCirculo(var nRaio: Real);
var
  sValor: string;
  bValorValido: Boolean;
begin
  Writeln('-----Calcular área de um círculo-----');
  repeat
    Writeln(EmptyStr);
    Write('Informe o raio do círculo: ');
    Readln(sValor);

    nRaio := StrToFloatDef(sValor, ZeroValue);
    bValorValido := (nRaio > ZeroValue);
    if not bValorValido then
      Writeln('Informe um valor válido');
  until bValorValido;
end;

procedure MostrarAreaCirculo(const pHandleDll: THandle);
var
  oCalcularAreaCirculo: TCalcularAreaCirculo;
  nRaio: Real;
  nArea: Real;
begin
  PegarDadosCirculo(nRaio);

  @oCalcularAreaCirculo := GetProcAddress(pHandleDll, 'CalcularAreaCirculo');
  if not Assigned(oCalcularAreaCirculo) then
    raise Exception.Create('Função não encontrada!!');

  nArea := oCalcularAreaCirculo(nRaio);
  Writeln('A área do circulo eh: '+ FormatFloat('#0.00',nArea));
end;

procedure PegarDadosQuadradoRetangulo(var nBase: Real; var nAltura: Real);
var
  sValor: string;
  bValoresValidos: Boolean;
begin
  Writeln('-----Calcular área de um quadrado/retângulo-----');
  repeat
    Writeln(EmptyStr);
    Write('Informe a base: ');
    Readln(sValor);
    nBase := StrToFloatDef(sValor, ZeroValue);

    Write('Informe a altura: ');
    Readln(sValor);
    nAltura := StrToFloatDef(sValor, ZeroValue);

    bValoresValidos := ((nBase > ZeroValue) and (nAltura > ZeroValue));
    if not bValoresValidos then
      Writeln('Informe um valor válido');
  until bValoresValidos;
end;

procedure MostrarAreaQuadradoRetangulo(const pHandleDll: THandle);
var
  oCalcularAreaQuadradoRetangulo: TCalcularAreaQuadradoRetangulo;
  nBase: Real;
  nAltura: Real;
  nArea: Real;
begin
  PegarDadosQuadradoRetangulo(nBase, nAltura);

  @oCalcularAreaQuadradoRetangulo := GetProcAddress(pHandleDll, 'CalcularAreaQuadradoRetangulo');
  if not Assigned(oCalcularAreaQuadradoRetangulo) then
    raise Exception.Create('Função não encontrada!!');

  nArea := oCalcularAreaQuadradoRetangulo(nBase, nAltura);
  Writeln('A área do quadrado/retângulo é: '+FormatFloat('#0.00',nArea));
end;

procedure main;
var
  sOperacao: String;
  hDll: THandle;
  bOperacaoValida: Boolean;
begin
  repeat
    Writeln('Área de um triângulo          [1]');
    Writeln('Área de um círculo            [2]');
    Writeln('Área de um quadrado/retângulo [3]');
    Writeln(EmptyStr);
    Write('Digite o número relacionado a operação desejada: ');
    Readln(sOperacao);
    Writeln;

    bOperacaoValida := MatchStr(sOperacao,['1','2','3']);
    if not bOperacaoValida then
      Writeln('Digito inválido! Tente novamente.');

    Writeln(EmptyStr);
  until bOperacaoValida;

  hDll := LoadLibrary(sNomeBiblioteca);
  try
    if hDll = 0 then
      raise Exception.Create('Biblioteca não encontrada!!');

    case sOperacao.ToInteger of
      1: MostrarAreaTriangulo(hDll);
      2: MostrarAreaCirculo(hDll);
      3: MostrarAreaQuadradoRetangulo(hDll);
    end;
    Readln;
  finally
    FreeLibrary(hDll);
  end;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
