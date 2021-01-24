unit uTPreProcessor;
                    interface

uses
  System.JSON;

type
  TPreProcessor = class
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

{ TPreProcessor }

constructor TPreProcessor.create;
begin
  inherited;
  fResultJSON := TJSONObject.Create;
end;

destructor TPreProcessor.destroy;
begin
  fResultJSON.Free;
  inherited;
end;

procedure TPreProcessor.validateToken(p_version: integer; const p_token: string);
begin
  { TODO : implementar la validaci�n del token contra BD }
end;

function TPreProcessor.work(p_version: integer; const p_token, p_message: string): TJSONObject;
begin

  result := fResultJSON;

end;

end.
