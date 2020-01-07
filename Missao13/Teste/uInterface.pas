unit uInterface;

interface

type
  IFileRead = interface
    ['{79707E8B-0F1D-4897-978E-EF4AD480809B}']
    procedure ReadToFile;
  end;

  IFileWrite = interface
  ['{C839DD9B-DF03-48E4-931F-13D88214C838}']
    procedure SaveToFile;
  end;

implementation

end.
