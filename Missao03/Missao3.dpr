//////////////////////////////////////////////////////////////
//   Autor: Luan Victornio                                  //
//    Data: 05/12/2019                                      //
//  Miss�o: Em uma aplica��o console, escreva um programa   //
//          que leia os seguintes dados: nome do vendedor,  //
//          sal�rio fixo e total de vendas. Considerando    //
//          que o sal�rio fixo tem um acr�scimo de 15% com  //
//          base no total vendido, apresente na tela: o     //
//          nome do usu�rio, o sal�rio fixo e o valor a     //
//          receber. Obs: Utilize um objeto para armazenar  //
//          essas informa��es do vendedor.                  //
//////////////////////////////////////////////////////////////
program Missao3;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uVendedor in 'uVendedor.pas';

function ValidarValor(pValor: String): Real;
begin
  Result := StrToFloatDef(pValor,0);
end;

procedure main;
const
  sFORMAT = '###,##0.00';
var
  oVendedor: TVendedor;
  sValor: String;
  nValorReceber: Real;
begin
  oVendedor := TVendedor.Create;
  try
    repeat
      Write('Informe o nome do vendedor: ');
      Readln(sValor);
      oVendedor.Nome := sValor;

      Write('Informe o sal�rio fixo: ');
      Readln(sValor);
      oVendedor.SalarioFixo := ValidarValor(sValor);

      Write('Informe o total de vendas: ');
      Readln(sValor);
      oVendedor.TotalVendas := ValidarValor(sValor);

      Writeln(EmptyStr);
      if oVendedor.ValidarDados then
        Break;

      Writeln('Dados inv�lidos, favor informe-os novamente!!');
    until oVendedor.ValidarDados;

    nValorReceber := oVendedor.CalcularValorReceber;
    Writeln('===================');
    Writeln('Vendedor: '+oVendedor.Nome);
    Writeln('Sal�rio Fixo: R$'+ FormatFloat(sFORMAT, oVendedor.SalarioFixo));
    Writeln('Valor a receber: R$'+ FormatFloat(sFORMAT, nValorReceber));
    Writeln('===================');
    Readln;
  finally
    oVendedor.Free;
  end;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
