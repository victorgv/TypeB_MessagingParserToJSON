unit uTProcessor;
                    interface

uses
  System.JSON;

type
  TProcessor = class
  private
    fResultJSON: TJSONObject;
    procedure validateToken(p_version: integer; const p_token: string);
  protected
  public
    function work(p_version: integer; const p_token,p_message: string): TJSONObject;
    //
    constructor create; overload;
    destructor destroy; overload;
  end;

implementation

{ TProcessor }

constructor TProcessor.create;
begin
  inherited;
  fResultJSON := TJSONObject.Create;
end;

destructor TProcessor.destroy;
begin
  fResultJSON.Free;
  inherited;
end;

procedure TProcessor.validateToken(p_version: integer; const p_token: string);
begin
  { TODO : implementar la validación del token contra BD }
end;

function TProcessor.work(p_version: integer; const p_token, p_message: string): TJSONObject;
begin

  result := fResultJSON;

end;

end.
