program TypeB_Messaging_To_JSON_TESTING;

uses
  Vcl.Forms,
  ufmTesting in '..\..\Source\ufmTesting.pas' {fmTesting},
  uTServiceImplementationSUPER in '..\..\lib\MyDelphiLibrary\VCL\WindowsService\TServiceImplementationSUPER\uTServiceImplementationSUPER.pas',
  uTServiceImplementation in '..\..\source\uTServiceImplementation.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmTesting, fmTesting);
  Application.Run;
end.
