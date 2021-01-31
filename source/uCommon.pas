unit uCommon;

interface

uses System.JSON;

type
  TProcessMessageFUNCTION = function(const p_message: String): TJSONObject; stdcall;
  TDLLVersionFUNCTION = function: String; stdcall;
  TDLLInfoFUNCTION = function: String; stdcall;

implementation

end.
