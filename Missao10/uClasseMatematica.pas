unit uClasseMatematica;

interface

type
  TOperacaoMatematica = reference to function: double;

  TClasseMatematica = class
  private
    FEsquerda: double;
    FDireita: double;
    FOperacaoMatematica: TOperacaoMatematica;
  public
    property Esquerda: double read FEsquerda write FEsquerda;
    property Direita: double read FDireita write FDireita;
    property OperacaoMatematica: TOperacaoMatematica read FOperacaoMatematica write FOperacaoMatematica;
  end;

implementation

end.
