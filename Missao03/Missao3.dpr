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
