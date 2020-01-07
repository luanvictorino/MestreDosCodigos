program mission12;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Classes,
  System.Classes.Helper in 'System.Classes.Helper.pas';

procedure main;
var
  oList: TStringList;
begin
  oList := TStringList.Create;
  try
    try
      oList.toJson;
    except
      on E: Exception do
        Writeln(e.Message);
    end;

    try
      oList.Add('duplicated');
      oList.Add('duplicated');
      oList.toJson;
    except
      on E: Exception do
        Writeln(e.Message);
    end;

    try
      oList.Clear;
      oList.Add('Invalid Item');
      oList.toJson;
    except
      on E: Exception do
        Writeln(e.Message);
    end;

    oList.Clear;
    oList.Values['Code'] := 10.ToString;
    oList.Values['Name'] := 'Messias';
    oList.Values['Active'] := 'True';
    oList.Values['City'] := 'null';

    Writeln(oList.toJson);
  finally
    oList.Free;
  end;

  Readln;
end;

begin
  ReportMemoryLeaksOnShutdown := True;
  main;
end.
