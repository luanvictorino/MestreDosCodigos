unit uClassReader;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,
  System.TypInfo,
  System.RTTI;

type
  TClassReader = class
  private
  public
    function GetMethods<T>: TList<string>; overload;
    function GetProperties<T>: TList<string>; overload;

    procedure GetMethods<T>(pList: TStrings); overload;
    procedure GetProperties<T>(pList: TStrings); overload;
  end;

implementation

{ TClassReader }

function TClassReader.GetMethods<T>: TList<string>;
var
  rContext: TRttiContext;
  oType: TRttiType;
  oRttiMethod: TRttiMethod;
begin
  Result := TList<string>.Create;

  rContext := TRttiContext.Create;
  try
    oType := rContext.GetType(TypeInfo(T));

    for oRttiMethod in oType.GetMethods do
      Result.Add(oRttiMethod.Name);
  finally
    rContext.free;
  end;
end;

procedure TClassReader.GetMethods<T>(pList: TStrings);
var
  oList: TList<string>;
  sItem: string;
begin
  oList := Self.GetMethods<T>;
  try
    for sItem in oList do
      pList.Add(sItem);
  finally
    oList.Free;
  end;
end;

function TClassReader.GetProperties<T>: TList<string>;
var
  rContext: TRttiContext;
  oType: TRttiType;
  oRttiProperty: TRttiProperty;
begin
  rContext := TRttiContext.Create;
  try
    oType := rContext.GetType(TypeInfo(T));

    Result := TList<string>.Create;
    for oRttiProperty in oType.GetProperties do
      Result.Add(oRttiProperty.Name);
  finally
    rContext.free;
  end;
end;

procedure TClassReader.GetProperties<T>(pList: TStrings);
var
  oList: TList<string>;
  sItem: string;
begin
  oList := Self.GetProperties<T>;
  try
    for sItem in oList do
      pList.Add(sItem);
  finally
    oList.Free;
  end;
end;

end.
