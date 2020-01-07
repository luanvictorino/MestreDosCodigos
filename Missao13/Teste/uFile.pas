unit uFile;

interface

uses
  System.SysUtils,
  System.Classes,
  uInterface;

type
  TFile = class(TInterfacedObject,IFileRead,IFileWrite)
  private
    FFileList: TStringList;
    FFileCreate: Boolean;
    FPath: string;
    FFileName: string;

    procedure Valid;
    function PathFull: string;
  public
    constructor Create(const pPath: string; const pFileName: string); overload;
    constructor Create(const pPath: string; const pFileName: string;
      pFileList: TStringList); overload;
    Destructor Destroy; Override;

    procedure ReadToFile;
    procedure SaveToFile;

    property FileList: TStringList read FFileList;
    property Path: string read FPath write FPath;
    property FileName: string read FFileName write FFileName;
  end;


implementation

{ TStringList }
constructor TFile.Create(const pPath, pFileName: string);
begin
  Self.Create(pPath, pFileName, TStringList.Create);
  Self.FFileCreate := True;
end;

constructor TFile.Create(const pPath, pFileName: string;
  pFileList: TStringList);
begin
  Self.FPath := pPath;
  Self.FFileName := pFileName;
  Self.FFileList := pFileList;

  Self.FFileCreate := False;
end;

destructor TFile.Destroy;
begin
  if (Self.FFileCreate) then
    Self.FFileList.Free;

  inherited;
end;

function TFile.PathFull: string;
begin
  Result := Self.FPath + '\' + Self.FFileName;
end;

procedure TFile.ReadToFile;
begin
  Self.Valid;

  if (not FileExists(Self.PathFull)) then
    raise Exception.Create('File not exists');

  Self.FFileList.LoadFromFile(Self.PathFull);
end;

procedure TFile.SaveToFile;
begin
  Self.Valid;

  Self.FFileList.SaveToFile(Self.PathFull);
end;

procedure TFile.Valid;
begin
  if (not DirectoryExists(Self.FPath)) then
    raise Exception.Create('Path does not exist');

  if (Self.FFileName.Trim.IsEmpty) then
    raise Exception.Create('File name not entered');
end;

end.
