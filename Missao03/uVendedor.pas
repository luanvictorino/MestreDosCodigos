unit uVendedor;

interface

type

  TVendedor = class
  private

    FNome: String;
    FSalarioFixo: Real;
    FTotalVendas: Real;
    procedure SetNome(Value: String);
    procedure SetSalarioFixo(Value: Real);
    procedure SetTotalVendas(Value: Real);
  public
    function CalcularValorReceber: Real;
    procedure MostrarValorReceber;
    function ValidarDados: boolean;
    property Nome: String read FNome write SetNome;
    property SalarioFixo: Real read FSalarioFixo write SetSalarioFixo;
    property TotalVendas: Real read FTotalVendas write SetTotalVendas;
  end;

implementation

uses
  System.SysUtils;

{ TVendedor }

function TVendedor.CalcularValorReceber: Real;
var
  nTotalAcrescimo: Real;
  nAcrescimo: Real;
begin
  nAcrescimo := 0.15;
  nTotalAcrescimo := TotalVendas*nAcrescimo;
  Result := SalarioFixo + nTotalAcrescimo;
end;

procedure TVendedor.MostrarValorReceber;
var
  nValorReceber: Real;
begin
  nValorReceber := CalcularValorReceber;
  Writeln('===================');
  Writeln('Vendedor: '+Nome);
  Writeln('Salário Fixo: R$'+FormatFloat('#0.00',SalarioFixo));
  Writeln('Valor a receber: R$'+FormatFloat('#0.00',nValorReceber));
end;

function TVendedor.ValidarDados: boolean;
begin
  result := false;

  if Nome.IsEmpty then
    Exit;

  if SalarioFixo <= 0 then
    Exit;

  if TotalVendas <= 0 then
    Exit;

  result := true;
end;

procedure TVendedor.SetNome(Value: String);
begin
  FNome := Value;
end;

procedure TVendedor.SetSalarioFixo(Value: Real);
begin
  FSalarioFixo := Value;
end;

procedure TVendedor.SetTotalVendas(Value: Real);
begin
  FTotalVendas := Value;
end;


end.
