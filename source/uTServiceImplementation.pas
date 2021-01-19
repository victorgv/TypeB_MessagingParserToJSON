unit uTServiceImplementation;

interface

uses uTServiceImplementationSUPER,IdHTTPWebBrokerBridge,MVCFramework.Commons,Winapi.Windows,
  System.SysUtils, Web.WebReq,udmWebModule;

type TServiceImplementation = Class(TServiceImplementationSUPER)
  private
    LServer: TIdHTTPWebBrokerBridge;
    procedure createServer;
  protected
    procedure validateInstanceIsLive; override;
    function getServiceCode: String; Override;  // Unique code to indentify your service
    procedure Initializations; override;
  public

End;

implementation

{ TServiceImplementation }


procedure TServiceImplementation.createServer;
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

function TServiceImplementation.getServiceCode: String;
begin
  result := 'TypeB_ToJSON';
end;

procedure TServiceImplementation.Initializations;
begin
  inherited;
  LServer := NIL;

end;

procedure TServiceImplementation.validateInstanceIsLive;
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
