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
begin
  mmXml.Lines.Clear;
  oXMLResponseType := uXmlMissao19.LoadResponse('../../xmlMissao19.xml');

  for nIndice := 0 to Pred(oXMLResponseType.Result.Count) do
  begin
    oXMLItemType := oXMLResponseType.Result.Item[nIndice];

    with mmXml.Lines do
    begin
      Add('ID: ' + oXMLItemType.Id.ToString);
      Add('Nome: ' + oXMLItemType.First_name);
      Add('Sobrenome: ' + oXMLItemType.Last_name);
      Add('Gênero: ' + oXMLItemType.Gender);
      Add('Data de Nascimento: ' + oXMLItemType.Dob);
      Add('E-mail: ' + oXMLItemType.Email);
      Add('Telefone: ' + oXMLItemType.Phone);
      Add('Website: ' + oXMLItemType.Website);
      Add('Endereço: ' + oXMLItemType.Address);
      Add('Status: ' + oXMLItemType.Status);
      Add('Link (HATEOAS):');
      Add('|_ Recurso: ' + oXMLItemType._links.Self.Href);
      Add('|_ Editar: ' + oXMLItemType._links.Edit.Href);
      Add('|_ Avatar: ' + oXMLItemType._links.Avatar.Href);
      Add('------------------------------------------------------------');
    end;
  end;
end;

end.
