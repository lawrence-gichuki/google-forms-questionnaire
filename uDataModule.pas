unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
  TDataModule1 = class(TDataModule)
    FDConnectionMySQL: TFDConnection;
    FDQueryCount: TFDQuery;
    FDQueryMessages: TFDQuery;
    FDQueryMessagesdestinationAddr: TLargeintField;
    FDQueryMessagesdateCreated: TDateTimeField;
    FDConnectionPostgreSQL: TFDConnection;
    FDQueryCounttotal: TLargeintField;
    FDQuerySummary: TFDQuery;
    FDQuerySummaryreg_date: TDateField;
    FDQuerySummarypatients: TLargeintField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
