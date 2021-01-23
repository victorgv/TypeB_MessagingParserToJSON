unit ufmTesting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uTServiceImplementation_TypeB_Messaging_To_JSON,
  Vcl.ComCtrls, Vcl.Buttons  ;

type
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
    Label1: TLabel;
    bt_runServer: TButton;
    bt_port: TEdit;
    me_message: TMemo;
    ed_token: TEdit;
    Label2: TLabel;
    ed_version: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    bt_process_message: TSpeedButton;
    me_json_result: TMemo;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bt_runServerClick(Sender: TObject);
    procedure bt_process_messageClick(Sender: TObject);
  private
    fServiceImplementation: TServiceImplementation_TypeB_Messaging_To_JSON;
    procedure writeLine_To_Log(const p_line: String);
  public
    { Public declarations }
  end;

var
  fmTesting: TfmTesting;

implementation

{$R *.dfm}

uses uTProcessor;

procedure TfmTesting.bt_process_messageClick(Sender: TObject);
var
  processor: TProcessor;
begin
  processor := TProcessor.create;
  try
    me_json_result.Text := processor.work(StrToIntDef(ed_version.Text,-1),ed_token.text,me_message.Text).ToString;
  finally
    processor.Free;
  end;

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
