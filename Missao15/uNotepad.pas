unit uNotepad;

interface

type
  TNotepad = class
  public
    procedure Executar;
  end;

implementation

uses
  Winapi.Windows;

{ TNotepad }

procedure TNotepad.Executar;
begin
  winExec('Notepad.exe', sw_shownormal);
end;

initialization
  TNotepad.ClassName;

end.
