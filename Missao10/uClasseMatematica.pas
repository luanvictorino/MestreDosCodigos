unit uClasseMatematica;

interface



type
  TOperacaoMatematica = reference to function: double;

  TClasseMatematica = class
  private
    FEsquerda: double;
    FDireita: double;
    FOperacaoMatematica: TOperacaoMatematica;
    procedure SetDireita(const Value: double);
    procedure SetEsquerda(const Value: double);
    procedure SetOperacaoMatematica(const Value: TOperacaoMatematica);
  published
    property Esquerda: double read FEsquerda write SetEsquerda;
    property Direita: double read FDireita write SetDireita;
    property OperacaoMatematica: TOperacaoMatematica read FOperacaoMatematica write SetOperacaoMatematica;
  end;

implementation

{ TClasseMatematica }

procedure TClasseMatematica.SetDireita(const Value: double);
begin
  FDireita := Value;
end;

procedure TClasseMatematica.SetEsquerda(const Value: double);
begin
  FEsquerda := Value;
end;

procedure TClasseMatematica.SetOperacaoMatematica(
  const Value: TOperacaoMatematica);
begin
  FOperacaoMatematica := Value;
end;

end.
