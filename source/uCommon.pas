unit uCommon;

interface

uses System.JSON;

type
  TProcessMessageFUNCTION = function(const p_message: String): TJSONObject; stdcall;

implementation

end.
