unit ufmTesting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uTServiceImplementation;

type
  TfmTesting = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    rb_internal: TRadioButton;
    rb_server: TRadioButton;
    Panel3: TPanel;
    bt_runServer: TButton;
    bt_port: TEdit;
    Label1: TLabel;
    Panel4: TPanel;
    me_log: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bt_runServerClick(Sender: TObject);
  private
    fServiceImplementation: TServiceImplementation;
    procedure writeLine_To_Log(const line: String);
  public
    { Public declarations }
  end;

var
  fmTesting: TfmTesting;

implementation

{$R *.dfm}

procedure TfmTesting.bt_runServerClick(Sender: TObject);
begin
  if not assigned(fServiceImplementation) then // Start
  begin
    fServiceImplementation := TServiceImplementation.Create(writeLine_To_Log);
    TThread.CreateAnonymousThread(
      procedure
      begin
        fServiceImplementation.ServiceExecute;
      end);
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

procedure TfmTesting.writeLine_To_Log(const line: String);
begin
  me_log.Lines.Add(line);
end;

end.
