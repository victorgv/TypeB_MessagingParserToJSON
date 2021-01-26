program TypeB_Messaging_To_JSON_TESTING;

uses
  Vcl.Forms,
  ufmTesting in '..\..\Source\ufmTesting.pas' {fmTesting},
  uTServiceImplementationSUPER in '..\..\lib\MyDelphiLibrary\VCL\WindowsService\TServiceImplementationSUPER\uTServiceImplementationSUPER.pas',
  udmWebModule in '..\..\source\udmWebModule.pas' {DmWebModule: TWebModule},
  uTController in '..\..\source\uTController.pas',
  uTServiceImplementation_TypeB_Messaging_To_JSON in '..\..\source\uTServiceImplementation_TypeB_Messaging_To_JSON.pas',
  uCommon in '..\..\source\uCommon.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmTesting, fmTesting);
  Application.Run;
end.
