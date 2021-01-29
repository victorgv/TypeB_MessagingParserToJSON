program TypeB_Messaging_To_JSON_SERVICE;

uses
  Vcl.SvcMgr,
  udmService in '..\..\Source\udmService.pas' {dmService: TService},
  uTServiceImplementationSUPER in '..\..\lib\MyDelphiLibrary\VCL\WindowsService\TServiceImplementationSUPER\uTServiceImplementationSUPER.pas',
  udmWebModule in '..\..\source\udmWebModule.pas' {DmWebModule: TWebModule},
  uTController in '..\..\source\uTController.pas',
  uTServiceImplementation_TypeB_Messaging_To_JSON in '..\..\source\uTServiceImplementation_TypeB_Messaging_To_JSON.pas',
  uCommon in '..\..\source\uCommon.pas';

{$R *.RES}

begin
  // Windows 2003 Server requires StartServiceCtrlDispatcher to be
  // called before CoRegisterClassObject, which can be called indirectly
  // by Application.Initialize. TServiceApplication.DelayInitialize allows
  // Application.Initialize to be called from TService.Main (after
  // StartServiceCtrlDispatcher has been called).
  //
  // Delayed initialization of the Application object may affect
  // events which then occur prior to initialization, such as
  // TService.OnCreate. It is only recommended if the ServiceApplication
  // registers a class object with OLE and is intended for use with
  // Windows 2003 Server.
  //
  // Application.DelayInitialize := True;
  //
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TdmService, dmService);
  Application.Run;
end.
