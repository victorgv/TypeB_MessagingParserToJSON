unit ufmTesting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uTServiceImplementation_TypeB_Messaging_To_JSON,
  Vcl.ComCtrls, Vcl.Buttons, System.JSON;


type
  TProcessMessage = function(const p_message: String): TJSONObject; stdcall;
  TfmTesting = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    rb_internal: TRadioButton;
    rb_server: TRadioButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel4: TPanel;
    me_log: TMemo;
    Panel3: TPanel;
    me_message: TMemo;
    ed_token: TEdit;
    Label2: TLabel;
    ed_version: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    bt_process_message: TSpeedButton;
    me_json_result: TMemo;
    Label5: TLabel;
    Label1: TLabel;
    bt_port: TEdit;
    bt_runServer: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bt_runServerClick(Sender: TObject);
    procedure bt_process_messageClick(Sender: TObject);
  private
    fServiceImplementation: TServiceImplementation_TypeB_Messaging_To_JSON;
    fDll: THandle;
    fProcessMessage: TProcessMessage;
    procedure writeLine_To_Log(const p_line: String);
  public
    { Public declarations }
  end;

var
  fmTesting: TfmTesting;

implementation

{$R *.dfm}



procedure TfmTesting.bt_process_messageClick(Sender: TObject);
begin
  if fDll = 0 then // If DLL doesn't loaded
  begin
    fDll := LoadLibrary('TypeB_Messaging_To_JSON_DLL.dll');
    fProcessMessage := GetProcAddress(fDll,'processMessage');
  end;

  me_json_result.Text := fProcessMessage(me_message.Text).ToString;

end;

procedure TfmTesting.bt_runServerClick(Sender: TObject);
begin
  if not assigned(fServiceImplementation) then // Start
  begin
    fServiceImplementation := TServiceImplementation_TypeB_Messaging_To_JSON.Create(writeLine_To_Log);
    fServiceImplementation.ServiceExecute;
    bt_runServer.Caption := 'Stop server';
  end
  else // Stop
  begin
    fServiceImplementation.ServiceStop;
    freeAndNil(fServiceImplementation);
    bt_runServer.Caption := 'Run server';
  end;
  bt_port.Enabled := NOT Assigned(fServiceImplementation);
end;

procedure TfmTesting.FormCreate(Sender: TObject);
begin
  fServiceImplementation := NIL;
  fDll := 0;
end;

procedure TfmTesting.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fServiceImplementation);
end;

procedure TfmTesting.writeLine_To_Log(const p_line: String);
begin
  me_log.Lines.Add(p_line);
end;

end.
