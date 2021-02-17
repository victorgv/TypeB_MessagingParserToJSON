unit ufmTesting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uTServiceImplementation_TypeB_Messaging_To_JSON,
  Vcl.ComCtrls, Vcl.Buttons, System.JSON, uCommon;


type
  TProcessMessageFUNCTION = function(const p_message: String): TJSONObject; stdcall;

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
    ed_port: TEdit;
    bt_runServer: TButton;
    RB_DLL: TRadioButton;
    ed_url: TEdit;
    Label6: TLabel;
    bt_show_dll_info: TButton;
    ck_format: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bt_runServerClick(Sender: TObject);
    procedure bt_process_messageClick(Sender: TObject);
    procedure RB_DLLClick(Sender: TObject);
    procedure bt_show_dll_infoClick(Sender: TObject);
  private
    fServiceImplementation: TServiceImplementation_TypeB_Messaging_To_JSON;
    fDll: THandle;
    fCallProcessMessage: TProcessMessageFUNCTION;
    fCallDLLVersion: TDLLVersionFUNCTION;
    fCallDLLInfo: TDLLInfoFUNCTION;
    procedure writeLine_To_Log(const p_line: String);
    procedure loadDll;
  public
    { Public declarations }
  end;

var
  fmTesting: TfmTesting;

implementation

{$R *.dfm}



procedure TfmTesting.bt_process_messageClick(Sender: TObject);
begin
  loadDll;

  if ck_format.Checked then me_json_result.Text := fCallProcessMessage(me_message.Text).Format(2)
  else me_json_result.Text := fCallProcessMessage(me_message.Text).ToString;


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
  ed_port.Enabled := NOT Assigned(fServiceImplementation);
end;

procedure TfmTesting.bt_show_dll_infoClick(Sender: TObject);
begin
  loadDll;
  ShowMessage(fCallDLLInfo);
end;

procedure TfmTesting.FormCreate(Sender: TObject);
begin
  fServiceImplementation := NIL;
  fDll := 0;
  RB_DLL.Checked := true;
end;

procedure TfmTesting.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fServiceImplementation);
end;

procedure TfmTesting.loadDll;
begin
  if fDll = 0 then // If DLL doesn't loaded
  begin
    fDll := LoadLibrary('..\..\..\..\lib\TypeB_Messaging_To_JSON_DLL\TypeB_Messaging_To_JSON_DLL.dll');
    fCallProcessMessage := GetProcAddress(fDll,'processMessage');
    fCallDLLVersion := GetProcAddress(fDll,'version');
    fCallDLLInfo := GetProcAddress(fDll,'info');
  end;
end;

procedure TfmTesting.RB_DLLClick(Sender: TObject);
begin
  TabSheet1.Enabled := RB_DLL.Checked;
  bt_show_dll_info.Enabled := RB_DLL.Checked;
  TabSheet2.Enabled := rb_internal.Checked OR rb_server.Enabled;
  ed_port.Enabled := rb_internal.Checked;
  bt_runServer.Enabled := rb_internal.Checked;
  ed_url.Enabled := rb_server.Checked;

end;

procedure TfmTesting.writeLine_To_Log(const p_line: String);
begin
  me_log.Lines.Add(p_line);
end;

end.
