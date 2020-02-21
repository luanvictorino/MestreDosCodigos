unit uVendedor;

interface

type

  TVendedor = class
  private
    FNome: String;
    FSalarioFixo: Real;
    FTotalVendas: real;
    procedure SetSalarioFixo(Value: Real);
    procedure SetTotalVendas(Value: Real);
  public
    function ValidarDados: boolean;
    function CalcularValorReceber: Real;
    property Nome: String read FNome write FNome;
    property SalarioFixo: Real read FSalarioFixo write SetSalarioFixo;
    property TotalVendas: Real read FTotalVendas write SetTotalVendas;
  end;

implementation

uses
  System.SysUtils;

{ TVendedor }

function TVendedor.ValidarDados: boolean;
begin
  Result := False;

  if Nome.IsEmpty then
    Exit;

  if SalarioFixo <= 0 then
    Exit;

  if TotalVendas <= 0 then
    Exit;

  Result := True;
end;

function TVendedor.CalcularValorReceber: Real;
const
  nACRESCIMO = 0.15;
var
  nTotalAcrescimo: Real;
begin
  nTotalAcrescimo := TotalVendas*nAcrescimo;
  Result := SalarioFixo + nTotalAcrescimo;
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
