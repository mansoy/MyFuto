unit uCfg;

interface

uses QJSON, System.SysUtils;

function GetCfg(AID: Integer): string;

implementation

function GetCfg(AID: Integer): string;
var
  sCfg: string;
  vJson: TQJson;
  vRet, vItems, vItem: TQJson;
begin
  Result := '{}';
  sCfg := ExtractFilePath(ParamStr(0)) + 'cfg.dat';
  vJson := TQJson.Create;
  vRet := TQJson.Create;
  try
    vJson.LoadFromFile(sCfg);
    vRet.Add('Font', vJson.ForcePath('DescTexts.Font'));
    vItems := vJson.ForcePath('DescTexts.Texts');
    for vItem in vItems do
    begin
      if vItem.IntByName('ID', 0) <> AID then Continue;
      vRet.Add('Texts', vItem);
      Break;
    end;
    Result := vRet.AsJson;
  finally
    FreeAndNil(vRet);
    FreeAndNil(vJson);
  end;
end;

end.
