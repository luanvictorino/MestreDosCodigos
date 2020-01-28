unit uVendedor;

interface

type

  TVendedor = class
  private
    FNome: String;
    FSalarioFixo: String;
    FTotalVendas: String;
    procedure SetNome(Value: String);
    procedure SetSalarioFixo(Value: String);
    procedure SetTotalVendas(Value: String);
  public
    function ValidarDados: boolean;
    function CalcularValorReceber: Real;
    procedure MostrarValorReceber;
    property Nome: String read FNome write SetNome;
    property SalarioFixo: String read FSalarioFixo write SetSalarioFixo;
    property TotalVendas: String read FTotalVendas write SetTotalVendas;
  end;

implementation

uses
  System.SysUtils;

{ TVendedor }

function TVendedor.CalcularValorReceber: Real;
const
  nAcrescimo = 0.15;
var
  nTotalAcrescimo: Real;
begin
  nTotalAcrescimo := StrToFloat(TotalVendas)*nAcrescimo;
  Result := StrToFloat(SalarioFixo) + nTotalAcrescimo;
end;

procedure TVendedor.MostrarValorReceber;
var
  nValorReceber: Real;
begin
  nValorReceber := CalcularValorReceber;
  Writeln('===================');
  Writeln('Vendedor: '+Nome);
  Writeln('Salário Fixo: R$'+FormatFloat('#0.00',StrToFloat(SalarioFixo)));
  Writeln('Valor a receber: R$'+FormatFloat('#0.00',nValorReceber));
  Writeln('===================');
end;

function TVendedor.ValidarDados: boolean;
begin
  Result := False;

  if Nome.IsEmpty then
    Exit;

  if SalarioFixo.IsEmpty then
    Exit;

  if TotalVendas.IsEmpty then
    Exit;

  Result := True;
end;

procedure TVendedor.SetNome(Value: String);
begin
  FNome := Value;
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
