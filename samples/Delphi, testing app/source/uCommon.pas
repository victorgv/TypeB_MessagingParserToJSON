unit uCommon;

interface

uses System.JSON;

type
  TProcessMessageFUNCTION = function(const p_message: String): TJSONObject; stdcall;
  TDLLVersionFUNCTION = function: ShortString; stdcall;
  TDLLInfoFUNCTION = function: ShortString; stdcall;

implementation

end.
