unit ufmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, System.JSON;

type
  TProcessMessageFUNCTION = function(const p_message: String): TJSONObject; stdcall;
  TDLLVersionFUNCTION = function: ShortString; stdcall;
  TDLLInfoFUNCTION = function: ShortString; stdcall;

  TForm2 = class(TForm)
    Panel1: TPanel;
    me_message: TMemo;
    Panel2: TPanel;
    Panel4: TPanel;
    me_json_result: TMemo;
    Button1: TButton;
    Panel5: TPanel;
    ComboBox1: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    fDll: THandle;
    fCallProcessMessage: TProcessMessageFUNCTION;
    fCallDLLVersion: TDLLVersionFUNCTION;
    fCallDLLInfo: TDLLInfoFUNCTION;
    procedure loadDll;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  loadDll;
  me_json_result.Text := fCallProcessMessage(me_message.Text).Format(2)
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    1: // MVT/AA
        me_message.Text := 'QK PMIAABB'+#13#10+
                           '.MUCZABB BB/290010'+#13#10+
                           'MVT'+#13#10+
                           'BB0891/28.ECABC.JFK'+#13#10+
                           'AA282356/290003'+#13#10+
                           'SI FR15,5';
    2: // MVT/ED
        me_message.Text := 'MVT/ED';
    else // MVT/AD
        me_message.Text := 'QD MADAABB'+#13#10+
                           '.UTCKM1P BB/290855 6A95A8JC'+#13#10+
                           'COR'+#13#10+
                           'MVT'+#13#10+
                           'CC4567/29.DATUK.DUS'+#13#10+
                           'AD0833/0844 EA1307 ACE'+#13#10+
                           'DL16/05/0013/0021'+#13#10+
                           'PX180'+#13#10+
                           'EDL23/0009'+#13#10+
                           'DLA//23B'+#13#10+
                           'SI 16/SLOW BOARDING D/T COVID 19 REGULATIONS';
  end;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  if fDll <> 0 then
    FreeLibrary(fDll);
end;

procedure TForm2.loadDll;
begin
  if fDll = 0 then // If DLL doesn't loaded
  begin
    fDll := LoadLibrary('..\..\..\..\lib\TypeB_Messaging_To_JSON_DLL\TypeB_Messaging_To_JSON_DLL.dll');
    fCallProcessMessage := GetProcAddress(fDll,'processMessage');
    fCallDLLVersion := GetProcAddress(fDll,'version');
    fCallDLLInfo := GetProcAddress(fDll,'info');
  end;
end;

end.
