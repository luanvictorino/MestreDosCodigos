unit uFuncionario;

interface

type
  TFuncionario = Class
  private
    FNome: String;
    FEmail: String;
    FTelefone: String;
  public
    property Nome: String read FNome write FNome;
    property Email: String read FEmail write FEmail;
    property Telefone: String read FTelefone write FTelefone;
  end;

implementation

end.
