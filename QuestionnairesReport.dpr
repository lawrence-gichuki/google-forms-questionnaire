program QuestionnairesReport;

uses
  Vcl.Forms,
  uReport in 'uReport.pas' {frmQuestionnaires},
  Vcl.Themes,
  Vcl.Styles,
  uDataModule in 'uDataModule.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 Purple');
  Application.CreateForm(TfrmQuestionnaires, frmQuestionnaires);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
