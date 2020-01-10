unit uRest;

interface

uses
  REST.Client,
  Json;

type
  TTestandoRest = class
  private
    FClient: TRESTClient;
    FRequest: TRESTRequest;
    FResponse: TRESTResponse;
  public
    constructor Create;
    destructor Destroy; override;
    {function CarregarApi(sBaseUrl, sResource, sResourceSuffix: String): String;}
    function GetUrlAsString(const pUrl: String): String;
    property Client: TRESTClient read FClient write FClient;
    property Request: TRESTRequest read FRequest write FRequest;
    property Response: TRESTResponse read FResponse write FResponse;
  end;



implementation

uses
  System.SysUtils,
  idHTTP,
  IdSSLOpenSSL;

{ TTestandoRest }

constructor TTestandoRest.Create;
begin
  Self.FClient := TRESTClient.Create(EmptyStr);
  Self.FRequest := TRestRequest.Create(nil);
  Self.FResponse := TRESTResponse.Create(nil);

  Self.Request.Client := Self.FClient;
  Self.Request.Response := Self.FResponse;
end;

destructor TTestandoRest.Destroy;
begin
  Self.FResponse.Free;
  Self.FRequest.Free;
  Self.FClient.Free;
  inherited;
end;

function TTestandoRest.GetUrlAsString(const pUrl: String): String;
var
  lHTTP: TIdHTTP;
begin
  lHTTP := TIdHTTP.Create(nil);
  try
    lHTTP.IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(lHTTP);
    Result := lHTTP.Get(pUrl);
  finally
    lHTTP.Free;
  end;
end;

{function TTestandoRest.CarregarApi(sBaseUrl, sResource, sResourceSuffix: String): String;
var
  pRows: TJSONPair;
  pArrayr: TJSONArray;
  retorno: TJSONObject;
begin
  Self.FClient.BaseURL := sBaseUrl;
  Self.FRequest.Resource := sResource;
  Self.FRequest.ResourceSuffix := sResourceSuffix;
  Self.FRequest.Execute;

  retorno := Request.Response.JSONValue as TJSONObject;
  pRows := retorno.GetValue('luan');
  pArrayr := pRows.JsonValue as TJSONArray;
  Result := Request.Response.JSONValue.ToJSON;
end;}

end.
