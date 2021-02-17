program TypeB_MessagingParserToJSON_direct_call_to_DLL;

uses
  ShareMem,
  Vcl.Forms,
  ufmMain in 'ufmMain.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
