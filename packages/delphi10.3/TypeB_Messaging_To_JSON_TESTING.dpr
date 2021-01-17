program TypeB_Messaging_To_JSON_TESTING;

uses
  Vcl.Forms,
  ufmTesting in '..\..\Source\ufmTesting.pas' {fmTesting},
  uTServiceImplementation in '..\..\source\uTServiceImplementation.pas',
  uTBaseServiceController in '..\..\lib\MyDelphiLibrary\VCL\WindowsService\TBaseServiceController\uTBaseServiceController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmTesting, fmTesting);
  Application.Run;
end.
