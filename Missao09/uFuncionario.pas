unit uFuncionario;

interface

type
  TFuncionario = class
  private
    FNome: String;
    FEmail: String;
    FTelefone: String;
    procedure SetNome(const Value: String);
    procedure SetEmail(const Value: String);
    procedure SetTelefone(const Value: String);
  public
    property Nome: String read FNome write SetNome;
    property Email: String read FEmail write SetEmail;
    property Telefone: String read FTelefone write SetTelefone;
  end;

implementation

{ TFuncionario }

procedure TFuncionario.SetEmail(const Value: String);
begin
  FEmail := Value;
end;

procedure TFuncionario.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TFuncionario.SetTelefone(const Value: String);
begin
  FTelefone := Value;
end;

end.
