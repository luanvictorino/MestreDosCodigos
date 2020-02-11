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

procedure main;
var
  oVendedor: TVendedor;
  sNome: String;
  sSalarioFixo: String;
  sTotalVendas: String;
  nValorReceber: Real;
begin
  oVendedor := TVendedor.Create;
  try
    repeat
    Write('Digite o nome do vendedor: ');
    Readln(sNome);
    oVendedor.Nome := sNome;

    Write('Digite o sal�rio fixo: ');
    Readln(sSalarioFixo);
    oVendedor.SalarioFixo := sSalarioFixo;

    Write('Digite o total de vendas: ');
    Readln(sTotalVendas);
    oVendedor.TotalVendas := sTotalVendas;

    if not oVendedor.ValidarDados then
      Writeln('Dados inv�lidos, favor informe-os novamente!!');
    until oVendedor.ValidarDados;

    nValorReceber := oVendedor.CalcularValorReceber;
    Writeln('===================');
    Writeln('Vendedor: '+oVendedor.Nome);
    Writeln('Sal�rio Fixo: R$'+FormatFloat('#0.00',StrToFloat(oVendedor.SalarioFixo)));
    Writeln('Valor a receber: R$'+FormatFloat('#0.00',nValorReceber));
    Writeln('===================');
  finally
    oVendedor.Free;
  end;

  Readln;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
