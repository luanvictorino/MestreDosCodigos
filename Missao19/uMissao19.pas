unit uMissao19;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfMissao19 = class(TForm)
    mmXml: TMemo;
    btCarregarXml: TButton;
    procedure btCarregarXmlClick(Sender: TObject);
  private
    procedure LerXml;
  end;

var
  fMissao19: TfMissao19;

implementation

uses
  uXmlMissao19;

{$R *.dfm}

{ TfMissao19 }

procedure TfMissao19.btCarregarXmlClick(Sender: TObject);
begin
  LerXml;
end;

procedure TfMissao19.LerXml;
var
  oXmlResponseType: IXMLResponseType;
  oXmlItemType: IXMLItemType;
  nIndice: Integer;
  Builder: TStringBuilder;
begin
  mmXml.Lines.Clear;
  oXMLResponseType := uXmlMissao19.LoadResponse('../../xmlMissao19.xml');

  for nIndice := 0 to Pred(oXMLResponseType.Result.Count) do
  begin
    oXMLItemType := oXMLResponseType.Result.Item[nIndice];

    Builder := TStringBuilder.Create(mmXml.Text);
    try
      mmXml.Text :=

      Builder.AppendLine('ID: ' + oXMLItemType.Id.ToString)
             .AppendLine('Nome: ' + oXMLItemType.First_name)
             .AppendLine('Sobrenome: ' + oXMLItemType.Last_name)
             .AppendLine('Gênero: ' + oXMLItemType.Gender)
             .AppendLine('Data de Nascimento: ' + oXMLItemType.Dob)
             .AppendLine('E-mail: ' + oXMLItemType.Email)
             .AppendLine('Telefone: ' + oXMLItemType.Phone)
             .AppendLine('Website: ' + oXMLItemType.Website)
             .AppendLine('Endereço: ' + oXMLItemType.Address)
             .AppendLine('Status: ' + oXMLItemType.Status)
             .AppendLine('Link (HATEOAS):')
             .AppendLine('|_ Recurso: ' + oXMLItemType._links.Self.Href)
             .AppendLine('|_ Editar: ' + oXMLItemType._links.Edit.Href)
             .AppendLine('|_ Avatar: ' + oXMLItemType._links.Avatar.Href)
             .AppendLine('------------------------------------------------------------')
             .ToString;
    finally
      Builder.Free;
    end;
  end;


end;

end.
