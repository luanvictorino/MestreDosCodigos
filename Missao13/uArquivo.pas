unit uArquivo;

interface

uses
  System.Classes,
  uInterface;

  type
    TArquivo = class(TInterfacedObject, ILerArquivo, ISalvarArquivo)
    private
      FLista: TStringList;
    protected
      function CaminhoArquivo: String;
    public
      procedure LerDoArquivo;
      procedure SalvarParaArquivo;
      property Lista: TStringList read FLista;
  end;

implementation

uses
  System.SysUtils,
  Vcl.Forms;

{ TArquivo }

function TArquivo.CaminhoArquivo: String;
begin
  Result := ExtractFilePath(Application.ExeName);
end;

procedure TArquivo.LerDoArquivo;
var
  sArquivo: TextFile;
  sLinha: String;
begin
  AssignFile(sArquivo, CaminhoArquivo + 'Missao13.txt');
  Reset(sArquivo);
  while not (Eof(sArquivo))do
  begin
    Readln(sArquivo, sLinha);
    Writeln(sLinha);
  end;
  CloseFile(sArquivo);
end;

procedure TArquivo.SalvarParaArquivo;
var
  sArquivo: TextFile;
begin
  AssignFile(sArquivo, CaminhoArquivo + 'Missao13.txt');
  Rewrite(sArquivo);
  Writeln(sArquivo, 'Primeira linha');
  Writeln(sArquivo, 'Segunda linha');
  Writeln(sArquivo, 'Terceira linha');
  CloseFile(sArquivo);
end;

end.
