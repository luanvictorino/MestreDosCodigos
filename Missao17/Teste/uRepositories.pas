unit uRepositories;

interface

uses
  REST.Json.Types;

type
  TRepository = class
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

  TRepositories = class
  private
    [JSONName('items')]
    FRepositories: TArray<TRepository>;
  public
    Destructor Destroy; override;

    property Repositories: TArray<TRepository> read FRepositories;
  end;

implementation

{ TRepositories }

destructor TRepositories.Destroy;
var
  oRepository: TRepository;
begin
  for oRepository in Self.FRepositories do
    oRepository.Free;

  inherited;
end;

end.
