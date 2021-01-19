unit uTServiceImplementation;

interface

uses uTServiceImplementationSUPER,IdHTTPWebBrokerBridge;

type TServiceImplementation = Class(TServiceImplementationSUPER)
  private
    LServer: TIdHTTPWebBrokerBridge;
  protected
    procedure validateInstanceIsLive; override;
    function getServiceCode: String; Override;  // Unique code to indentify your service
  public

End;

implementation

{ TServiceImplementation }


function TServiceImplementation.getServiceCode: String;
begin
  result := 'TypeB_ToJSON';
end;

procedure TServiceImplementation.validateInstanceIsLive;
begin
  if not assigned(LServer) then
   ; //...




end;

end.
