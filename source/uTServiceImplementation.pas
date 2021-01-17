unit uTServiceImplementation;

interface

uses uTBaseServiceController;

type TServiceImplementation = Class(TBaseServiceController)
  private
  protected
    procedure validateInstanceIsLive; override;

End;

implementation

{ TServiceImplementation }


procedure TServiceImplementation.validateInstanceIsLive;
begin

end;

end.
