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
    procedure rb_internalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    fServiceImplementation: TServiceImplementation;
  public
    { Public declarations }
  end;

var
  fmTesting: TfmTesting;

implementation

{$R *.dfm}

procedure TfmTesting.FormCreate(Sender: TObject);
begin
  fServiceImplementation := NIL;
end;

procedure TfmTesting.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fServiceImplementation);
end;

procedure TfmTesting.rb_internalClick(Sender: TObject);
begin
  if not assigned(fServiceImplementation) then
  begin
    fServiceImplementation := TServiceImplementation.Create(NIL);
  end;
end;

end.
