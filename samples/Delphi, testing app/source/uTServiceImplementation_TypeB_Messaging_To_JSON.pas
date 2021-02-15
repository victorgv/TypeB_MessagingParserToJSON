unit uTServiceImplementation_TypeB_Messaging_To_JSON;

interface

uses uTServiceImplementationSUPER,IdHTTPWebBrokerBridge,MVCFramework.Commons,Winapi.Windows,
  System.SysUtils, Web.WebReq,udmWebModule;

type TServiceImplementation_TypeB_Messaging_To_JSON = Class(TServiceImplementationSUPER)
  private
    LServer: TIdHTTPWebBrokerBridge;
    procedure createServer;
    procedure ServiceExecute;
    procedure ServiceStop;
  protected
    procedure validateInstanceIsLive; override;
    function getServiceCode: String; Override;  // Unique code to indentify your service
    procedure Initializations; override;
  public
    procedure Execute; override;
  End;

implementation

{ TServiceImplementation }


procedure TServiceImplementation_TypeB_Messaging_To_JSON.createServer;
begin
  sendEventToLogMessage('** DMVCFramework Server ** build ' + DMVCFRAMEWORK_VERSION,EVENTLOG_INFORMATION_TYPE);

  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  WebRequestHandlerProc.MaxConnections := 1024;

  LServer := TIdHTTPWebBrokerBridge.Create(nil);
  LServer.OnParseAuthentication := TMVCParseAuthentication.OnParseAuthentication;
  LServer.DefaultPort := 8080;
  LServer.KeepAlive := True;
  LServer.MaxConnections := 0;
  LServer.ListenQueue := 200;
  LServer.OnParseAuthentication := TMVCParseAuthentication.OnParseAuthentication;
  //
  LServer.Active := TRUE;
end;

procedure TServiceImplementation_TypeB_Messaging_To_JSON.Execute;
begin
  // (1) Pre-execute
  // ...

  try
    // (2) Execute... until service stopped
    inherited;
  finally
    // (3) Post-execute
    // Nothing for now
  end;


end;

function TServiceImplementation_TypeB_Messaging_To_JSON.getServiceCode: String;
begin
  result := 'TypeB_ToJSON';
end;

procedure TServiceImplementation_TypeB_Messaging_To_JSON.Initializations;
begin
  inherited;
  LServer := NIL;
end;

procedure TServiceImplementation_TypeB_Messaging_To_JSON.ServiceExecute;
begin
  inherited;
end;

procedure TServiceImplementation_TypeB_Messaging_To_JSON.ServiceStop;
begin
  inherited
end;

procedure TServiceImplementation_TypeB_Messaging_To_JSON.validateInstanceIsLive;
begin
  try
    while not Terminated AND (NOT TestApplicationTerminated) do  //
    begin
      if not assigned(LServer) then
        createServer;
      sleep(3000);
    end;
  finally
    freeAndNil(LServer);
  end;



end;

end.
