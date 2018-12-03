unit uFrmSecondaryPages;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uFrmBase, FMX.Ani, FMX.Objects,
  FMX.TabControl, FMX.Controls.Presentation, System.Actions, FMX.ActnList;

type
  TFrmSecondaryPages = class(TFrmBase)
    tabJDJS: TTabItem;
    tabXLTJ: TTabItem;
    tabCZJZ: TTabItem;
    tabZZJZ: TTabItem;
    tabLYDZ: TTabItem;
    tabFWZN: TTabItem;
    tabZXTS: TTabItem;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    Rectangle8: TRectangle;
    Rectangle9: TRectangle;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    Rectangle12: TRectangle;
    Rectangle13: TRectangle;
    Rectangle14: TRectangle;
    Rectangle15: TRectangle;
    Rectangle16: TRectangle;
    Rectangle17: TRectangle;
    Rectangle18: TRectangle;
    Rectangle19: TRectangle;
    Rectangle20: TRectangle;
    Rectangle21: TRectangle;
    Rectangle22: TRectangle;
    Rectangle24: TRectangle;
    Rectangle25: TRectangle;
    Rectangle26: TRectangle;
    RoundRect1: TRoundRect;
    RoundRect2: TRoundRect;
    RoundRect3: TRoundRect;
    RoundRect4: TRoundRect;
    RoundRect5: TRoundRect;
    RoundRect6: TRoundRect;
    RoundRect7: TRoundRect;
    RoundRect8: TRoundRect;
    RoundRect9: TRoundRect;
    Rectangle27: TRectangle;
    Rectangle28: TRectangle;
    Rectangle29: TRectangle;
    Rectangle30: TRectangle;
    Rectangle31: TRectangle;
    Rectangle32: TRectangle;
    Rectangle33: TRectangle;
    rectPriorPage: TRectangle;
    rectNextPage: TRectangle;
    rectMainPage: TRectangle;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSecondaryPages: TFrmSecondaryPages;

implementation

uses uGlobal;

{$R *.fmx}

procedure TFrmSecondaryPages.FormCreate(Sender: TObject);
begin
  Self.PageLevel := plTwo;
  inherited;
end;

initialization
  RegisterClass(TFrmSecondaryPages);

finalization
  UnRegisterClass(TFrmSecondaryPages);

end.
