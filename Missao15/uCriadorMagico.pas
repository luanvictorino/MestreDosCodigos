unit uCriadorMagico;

interface

type
  TCriadorMagico = class
    class procedure AbrirNotepad;
  end;

implementation

uses
  System.Rtti;

{ TCriadorMagico }

class procedure TCriadorMagico.AbrirNotepad;
var
  rRttiContext: TRttiContext;
  oRttiInstanceType: TRttiInstanceType;
  oRttiMethod: TRttiMethod;
  rInstance: TValue;
begin
  rRttiContext := TRttiContext.Create;
  oRttiInstanceType := rRttiContext.FindType('uNotepad.TNotepad').AsInstance;
  oRttiMethod := oRttiInstanceType.GetMethod('Create');
  rInstance := oRttiMethod.Invoke(oRttiInstanceType.MetaclassType,[]);
  try
    oRttiMethod := oRttiInstanceType.GetMethod('Executar');
    oRttiMethod.Invoke(rInstance,[]);
  finally
    rInstance.AsObject.Free;
  end;
end;

end.
