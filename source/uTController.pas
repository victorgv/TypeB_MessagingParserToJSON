unit uTController;

interface

uses
  MVCFramework, MVCFramework.Commons, MVCFramework.Serializer.Commons, uCommon;

type

  [MVCPath('/api')]
  TController = class(TMVCController)
  private
    fDll: THandle; // Manages DLL with processor
    fCallProcessMessage: TProcessMessageFUNCTION;
  protected
    procedure OnBeforeAction(Context: TWebContext; const AActionName: string; var Handled: Boolean); override;
    procedure OnAfterAction(Context: TWebContext; const AActionName: string); override;

  public
    [MVCPath]
    [MVCHTTPMethod([httpGET])]
    procedure Index;

    [MVCPath('/keepalive')]
    [MVCHTTPMethod([httpGET])]
    procedure keepalive;


    [MVCPath('/message_processor')]
    [MVCHTTPMethod([httpPOST])]
    procedure messaging_processor;



    [MVCPath('/reversedstrings/($Value)')]
    [MVCHTTPMethod([httpGET])]
    procedure GetReversedString(const Value: String);


    //Sample CRUD Actions for a "Customer" entity
    [MVCPath('/customers')]
    [MVCHTTPMethod([httpGET])]
    procedure GetCustomers;

    [MVCPath('/customers/($id)')]
    [MVCHTTPMethod([httpGET])]
    procedure GetCustomer(id: Integer);

    [MVCPath('/customers')]
    [MVCHTTPMethod([httpPOST])]
    procedure CreateCustomer;

    [MVCPath('/customers/($id)')]
    [MVCHTTPMethod([httpPUT])]
    procedure UpdateCustomer(id: Integer);

    [MVCPath('/customers/($id)')]
    [MVCHTTPMethod([httpDELETE])]
    procedure DeleteCustomer(id: Integer);

    // -------------------------------------------------------------
    constructor Create; virtual;

  end;

implementation

uses
  System.SysUtils, MVCFramework.Logger, System.StrUtils, Winapi.Windows;

procedure TController.Index;
begin
  Render('Type B Messaging To JSON Processor');
end;

procedure TController.keepalive;
begin
  render('I''m alive');
end;

procedure TController.messaging_processor;
begin
  Render('message_processor');
  //me_json_result.Text := fCallProcessMessage(me_message.Text).ToString;
end;

procedure TController.GetReversedString(const Value: String);
begin
  Render(System.StrUtils.ReverseString(Value.Trim));
end;

procedure TController.OnAfterAction(Context: TWebContext; const AActionName: string); 
begin
  { Executed after each action }
  inherited;
end;

procedure TController.OnBeforeAction(Context: TWebContext; const AActionName: string; var Handled: Boolean);
begin
  { Executed before each action
    if handled is true (or an exception is raised) the actual
    action will not be called }
  inherited;
end;

//Sample CRUD Actions for a "Customer" entity
procedure TController.GetCustomers;
begin
  //todo: render a list of customers
end;

procedure TController.GetCustomer(id: Integer);
begin
  //todo: render the customer by id
end;

constructor TController.Create;
begin
  inherited;
  fDll := LoadLibrary('TypeB_Messaging_To_JSON_DLL.dll');
  fCallProcessMessage := GetProcAddress(fDll,'processMessage');
end;

procedure TController.CreateCustomer;

begin
  //todo: create a new customer
end;

procedure TController.UpdateCustomer(id: Integer);
begin
  //todo: update customer by id
end;

procedure TController.DeleteCustomer(id: Integer);
begin
  //todo: delete customer by id
end;



end.
