unit uVendedor;

interface

type

  TVendedor = class
  private
    FNome: String;
    FSalarioFixo: String;
    FTotalVendas: String;
    procedure SetSalarioFixo(Value: String);
    procedure SetTotalVendas(Value: String);
  public
    function ValidarDados: boolean;
    function CalcularValorReceber: Real;
    property Nome: String read FNome write FNome;
    property SalarioFixo: String read FSalarioFixo write SetSalarioFixo;
    property TotalVendas: String read FTotalVendas write SetTotalVendas;
  end;

implementation

uses
  System.SysUtils;

{ TVendedor }

function TVendedor.ValidarDados: boolean;
var
  nNumero: Extended;
begin
  Result := False;

  if Nome.IsEmpty then
    Exit;

  if SalarioFixo.IsEmpty then
    Exit;

  if TotalVendas.IsEmpty then
    Exit;

  if not(TryStrToFloat(SalarioFixo, nNumero)) then
    Exit;

  if nNumero < 0 then
    Exit;

  if not(TryStrToFloat(TotalVendas, nNumero)) then
    Exit;

  if nNumero < 0 then
    Exit;

  Result := True;
end;

function TVendedor.CalcularValorReceber: Real;
const
  nAcrescimo = 0.15;
var
  nTotalAcrescimo: Real;
begin
  nTotalAcrescimo := StrToFloat(TotalVendas)*nAcrescimo;
  Result := StrToFloat(SalarioFixo) + nTotalAcrescimo;
end;

procedure TVendedor.SetSalarioFixo(Value: String);
begin
  FSalarioFixo := StringReplace(Value, '.', ',', []);
end;

procedure TVendedor.SetTotalVendas(Value: String);
begin
  FTotalVendas := StringReplace(Value, '.', ',', []);
end;

end.
