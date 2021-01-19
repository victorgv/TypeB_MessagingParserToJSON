unit uTServiceImplementation;

interface

uses uTServiceImplementationSUPER;

type TServiceImplementation = Class(TServiceImplementationSUPER)
  private
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

end;

end.
