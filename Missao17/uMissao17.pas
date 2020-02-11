unit uMissao17;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Json, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.StdCtrls,
  System.Generics.Collections, System.Json, DBXJSONReflect, ComObj, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, REST.Response.Adapter, REST.Json.Types,
  Datasnap.Provider;

type
  TCamposApi = class
  private
    [JSONName('id')]
    FId: Int64;
    [JSONName('name')]
    FName: string;
    [JSONName('html_url')]
    FUrl: string;
    [JSONName('description')]
    FDescription: string;
  public
    property Id: Int64 read FId;
    property Name: string read FName;
    property Url: string read FUrl;
    property Description: string read FDescription;
  end;

  TApi = class
  private
    [JSONName('items')]
    FApi: TArray<TCamposApi>;
  public
    Destructor Destroy; override;
    property Api: TArray<TCamposApi> read FApi;
  end;

  TfMissao17 = class(TForm)
    lbInformeValor: TLabel;
    edtValor: TEdit;
    btConsultar: TButton;
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    DBGrid1: TDBGrid;
    dsMissao17: TDataSource;
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure btConsultarClick(Sender: TObject);
  private
    function CarregarApi: String;
    procedure CarregarDadosNoDataSet;
    procedure ConfigurarDataSet(var pClientDataSet: TClientDataSet);
  public
    { Public declarations }
  end;

var
  fMissao17: TfMissao17;

implementation

{$R *.dfm}

procedure TfMissao17.btConsultarClick(Sender: TObject);
begin
  CarregarDadosNoDataSet;
end;

procedure TfMissao17.CarregarDadosNoDataSet;
var
  oApi: TApi;
  oCamposApi: TCamposApi;
  sDadosApi: string;
  oClientDataSet: TClientDataSet;
begin
  sDadosApi := CarregarApi;

  ConfigurarDataSet(oClientDataSet);
  oApi := TJson.JsonToObject<TApi>(sDadosApi);
  try
    for oCamposApi in oApi.Api do
    begin
      oClientDataSet.Insert;
      oClientDataSet.FieldByName('Id').AsInteger := oCamposApi.Id;
      oClientDataSet.FieldByName('Name').AsString := oCamposApi.Name;
      oClientDataSet.FieldByName('Html_Url').AsString := oCamposApi.Url;
      oClientDataSet.FieldByName('Description').AsString := oCamposApi.Description;
      oClientDataSet.Post;
    end;

    dsMissao17.DataSet := oClientDataSet;
  finally
    oApi.Free;
  end;
end;

procedure TfMissao17.ConfigurarDataSet(var pClientDataSet: TClientDataSet);
begin
  pClientDataSet := TClientDataSet.Create(Self);
  with pClientDataSet do
  begin
    Close;
    FieldDefs.Clear;
    FieldDefs.Add('id', ftInteger);
    FieldDefs.Add('Name', ftString,80, False);
    FieldDefs.Add('Html_Url', ftString,100, False);
    FieldDefs.Add('Description', ftString,120, False);
    CreateDataSet;
    FieldByName('Id').DisplayWidth := 15;
    FieldByName('Name').DisplayWidth := 20;
    FieldByName('Html_Url').DisplayWidth := 45;
    FieldByName('Description').DisplayWidth := 40;
  end;
end;

function TfMissao17.CarregarApi: String;
begin
  RESTRequest.Params.AddUrlSegment('busca', edtValor.Text);
  RESTRequest.Execute;
  Result := RESTResponse.JSONText;
end;

procedure TfMissao17.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    btConsultarClick(Sender);
end;

destructor TApi.Destroy;
var
  oCamposApi: TCamposApi;
begin
  for oCamposApi in FApi do
    oCamposApi.Free;

  inherited;
end;

end.
