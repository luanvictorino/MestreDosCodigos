unit System.Classes.Helper;

interface

uses
  System.Classes;

type
  TStringListHelper = class helper for TStringList
  private
    procedure ValidToJson;
  public
    function IsEmpty: Boolean;
    function HasDuplicate: Boolean;
    function toJson: string;
  end;

implementation

uses
  System.SysUtils,
  System.Math,
  System.JSON;

{ TStringListHelper }

function TStringListHelper.IsEmpty: Boolean;
begin
  Result := Self.Count = ZeroValue;
end;

function TStringListHelper.HasDuplicate: Boolean;
var
  sList: TStringList;
  sItem: string;
begin
  sList := TStringList.Create;
  try
    sList.Sorted := True;
    sList.Duplicates := dupIgnore;

    for sItem in Self do
      sList.Add(sItem);

    Result := sList.Count <> Self.Count;
  finally
    sList.Free;
  end;
end;

procedure TStringListHelper.ValidToJson;
var
  nIndex: Integer;
begin
  if (Self.IsEmpty) then
    raise Exception.Create('List is Empty');

  if (Self.HasDuplicate) then
    raise Exception.Create('List has Duplicate item');

  for nIndex := ZeroValue to Pred(Self.Count) do
  begin
    if (Self.Names[nIndex] = EmptyStr) or
       (Self.ValueFromIndex[nIndex] = EmptyStr) then
      raise Exception.Create('List is invalid');
  end;
end;

function TStringListHelper.toJson: string;
var
  oJSON: TJSONObject;
  nIndex: Integer;
  sValue: string;
  nValueInteger: Double;
begin
  Self.ValidToJson;

  oJSON := TJSONObject.Create;
  try
    for nIndex := ZeroValue to Pred(Self.Count) do
    begin
      sValue := Self.ValueFromIndex[nIndex];
      if (sValue.ToLower.Trim = 'null') then
      begin
        oJSON.AddPair(Self.Names[nIndex],TJSONNull.Create);
      end
      else if (sValue.ToLower.Trim = 'true') then
      begin
        oJSON.AddPair(Self.Names[nIndex],TJSONTrue.Create);
      end
      else if (sValue.ToLower.Trim = 'false') then
      begin
        oJSON.AddPair(Self.Names[nIndex],TJSONFalse.Create);
      end
      else
      begin
        try
          nValueInteger := StrToFloat(sValue);
          oJSON.AddPair(Self.Names[nIndex],TJSONNumber.Create(nValueInteger));
          continue;
        except
        end;

        oJSON.AddPair(Self.Names[nIndex],Self.ValueFromIndex[nIndex]);
      end;
    end;

    Result := oJSON.ToString;
  finally
    oJSON.Free
  end;
end;

end.
