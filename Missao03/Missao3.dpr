//////////////////////////////////////////////////////////////
//  Autor: Luan Victornio                                   //
//    Date: 05/12/2019                                      //
// Mission: Em uma aplicação console, escreva um programa   //
//          que leia os seguintes dados: nome do vendedor,  //
//          salário fixo e total de vendas. Considerando    //
//          que o salário fixo tem um acréscimo de 15% com  //
//          base no total vendido, apresente na tela: o     //
//          nome do usuário, o salário fixo e o valor a     //
//          receber. Obs: Utilize um objeto para armazenar  //
//          essas informações do vendedor.                  //
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
begin
  oVendedor := TVendedor.Create;

  repeat
    Write('Digite o nome do vendedor: ');
    Readln(sNome);
    oVendedor.Nome := sNome;

    Write('Digite o salário fixo: ');
    Readln(sSalarioFixo);
    oVendedor.SalarioFixo := sSalarioFixo.ToDouble;

    Write('Digite o total de vendas: ');
    Readln(sTotalVendas);
    oVendedor.TotalVendas := sTotalVendas.ToDouble;

    if not oVendedor.ValidarDados then
      Writeln('Dados inválidos, favor informe-os novamente!!');
  until oVendedor.ValidarDados;

  oVendedor.MostrarValorReceber;
  Readln;
end;

begin
  main;
end.
