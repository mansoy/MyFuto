unit uGlobal;

interface

uses
	System.SysUtils, uPageParse;

type
  TPageLevel = (plOne, plTwo, plThree);

var
	GAppPath: string;
  GLastPageImgPath: string;
  GConfigFile: string;
	GAppConfig: TAppConfig;

implementation

initialization
	GAppPath := ExtractFilePath(ParamStr(0));
  GLastPageImgPath := GAppPath + 'Imgs\LastPages\';
  GConfigFile := GAppPath + 'Config\Config.cfg';
end.
