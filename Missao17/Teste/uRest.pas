unit uRest;

interface

uses
  System.SysUtils,
  REST.Client;

type
  TRest = class
  private
    FRESTClient: TRESTClient;
    FRESTRequest: TRESTRequest;
    FRESTResponse: TRESTResponse;
  public
    constructor Create;
    destructor Destroy; override;

    function Execute(Const pBaseUrl: string; Const pResource: string;
      Const ResourceSuffix: string): string;

    property RESTClient: TRESTClient read FRESTClient;
    property RESTRequest: TRESTRequest read FRESTRequest;
    property RESTResponse: TRESTResponse read FRESTResponse;
  end;

implementation

{ TRest }

constructor TRest.Create;
begin
  Self.FRESTClient := TRESTClient.Create(EmptyStr);
  Self.FRESTRequest := TRESTRequest.Create(nil);
  Self.FRESTResponse := TRESTResponse.Create(nil);

  Self.RESTRequest.Client := Self.FRESTClient;
  Self.RESTRequest.Response := Self.FRESTResponse;
end;

destructor TRest.Destroy;
begin
  Self.FRESTResponse.Free;
  Self.FRESTRequest.Free;
  Self.FRESTClient.Free;
  inherited;
end;

function TRest.Execute(const pBaseUrl, pResource,
  ResourceSuffix: string): string;
begin
  try
    Self.FRESTClient.BaseURL := pBaseUrl;
    Self.FRESTRequest.Resource := pResource;
    Self.FRESTRequest.ResourceSuffix := ResourceSuffix;
    Self.FRESTRequest.Execute;

    Result := Self.FRESTResponse.JSONValue.ToJSON;
  Except
    Result := EmptyStr;
  end;
end;

end.
