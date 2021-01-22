unit udmService;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs,uTServiceImplementation;

type
  TdmService = class(TService)
    procedure ServiceExecute(Sender: TService);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
  private
    { Private declarations }
    fServiceImplementation: TServiceImplementation;
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  dmService: TdmService;

implementation

{$R *.dfm}



procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  dmService.Controller(CtrlCode);
end;

function TdmService.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TdmService.ServiceExecute(Sender: TService);
begin
  while not Terminated do
  begin
    ServiceThread.ProcessRequests(True);
    Sleep(1000);
  end;
end;

procedure TdmService.ServiceStart(Sender: TService; var Started: Boolean);
begin
  fServiceImplementation := TServiceImplementation.Create(self);
  fServiceImplementation.ServiceExecute;
end;

procedure TdmService.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  fServiceImplementation.ServiceStop;
  freeAndNil(fServiceImplementation);
end;

end.
