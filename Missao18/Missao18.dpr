program Missao18;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, System.Json, REST.Json;

function AdicionarTerritorio(const pTerritory: TJSONValue; pLevel: TJSONValue;
  pExperience: TJSONValue; pDateLastMission: TJSONValue): TJSONObject;
var
  LJson: TJSONObject;
begin
  LJson := TJSONObject.Create;
  LJson.AddPair(TJSONPair.Create('terrytory', pTerritory));
  LJson.AddPair(TJSONPair.Create('level', pLevel));
  LJson.AddPair(TJSONPair.Create('experience', pExperience));
  LJson.AddPair(TJSONPair.Create('dateLastMission', pDateLastMission));
  Result := LJson;
end;

procedure Main;
var
  LJsonObject: TJSONObject;
  LArray: TJSONArray;
begin
  LJsonObject := TJSONObject.Create;
  try
    LJsonObject.AddPair(TJSONPair.Create('player', 'Mystery'));
    LJsonObject.AddPair(TJSONPair.Create('active', TJSONTrue.Create));

    LArray := TJSONArray.Create;
    LArray.AddElement(
      AdicionarTerritorio(
        TJSONString.Create('Delphi'),
        TJSONString.Create('squire'),
        TJSONNumber.Create(17),
        TJSONString.Create('2019-08-20')
      )
    );

    LArray.AddElement(
      AdicionarTerritorio(
        TJSONString.Create('SQL'),
        TJSONNull.Create,
        TJSONNumber.Create(0),
        TJSONNull.Create
      )
    );

    LArray.AddElement(
      AdicionarTerritorio(
        TJSONString.Create('Software Architecture'),
        TJSONString.Create('Knight'),
        TJSONNumber.Create(34),
        TJSONString.Create('2019-07-01')
      )
    );

    LJsonObject.AddPair(TJSONPair.Create('territories', LArray));
    Writeln(LJsonObject.Format);
  finally
    LJsonObject.Free;
  end;
  Readln;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  Main;
end.
