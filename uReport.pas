unit uReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfrmQuestionnaires = class(TForm)
    DBGrid1: TDBGrid;
    lblCount: TLabel;
    DataSource1: TDataSource;
    txtSearch: TEdit;
    DBGrid2: TDBGrid;
    Timer1: TTimer;
    lblThisMonth: TLabel;
    lblTotalSent: TLabel;
    Label1: TLabel;
    DataSource2: TDataSource;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure txtSearchChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQuestionnaires: TfrmQuestionnaires;

implementation

{$R *.dfm}

uses uDataModule;

procedure TfrmQuestionnaires.DBGrid1DblClick(Sender: TObject);
begin
DataModule1.FDQueryMessages.SQL.Clear;
DataModule1.FDQueryMessages.SQL.Add('SELECT destinationAddr,messageContent,dateCreated FROM feedback_view ORDER BY 3 DESC');
DataModule1.FDQueryMessages.Open();


DataModule1.FDQueryCount.SQL.Clear;
DataModule1.FDQueryCount.SQL.Add('SELECT count(patient_id) as total FROM visit_details_q_and_a ');
DataModule1.FDQueryCount.SQL.Add('WHERE reg_date = now()::date');
DataModule1.FDQueryCount.Open();

lblCount.Caption := 'Sent Today: ' + IntToStr(DataModule1.FDQueryCounttotal.value);

DataModule1.FDQueryCount.SQL.Clear;
DataModule1.FDQueryCount.SQL.Add('SELECT count(patient_id) as total FROM visit_details_q_and_a ');
DataModule1.FDQueryCount.SQL.Add('WHERE date_part(:month,reg_date) = date_part(:month,now()) and date_part(:year,reg_date) = date_part(:year,now())');
DataModule1.FDQueryCount.params.paramByName('month').value := 'month';
DataModule1.FDQueryCount.params.paramByName('year').value := 'year';
DataModule1.FDQueryCount.Open();

lblThisMonth.Caption := 'Sent This Month: ' + IntToStr(DataModule1.FDQueryCounttotal.value);

DataModule1.FDQueryCount.SQL.Clear;
DataModule1.FDQueryCount.SQL.Add('SELECT count(patient_id) as total FROM visit_details_q_and_a ');
DataModule1.FDQueryCount.Open();

lblTotalSent.Caption := 'Total Sent Since Inception on 10-02-2022: ' + IntToStr(DataModule1.FDQueryCounttotal.value);

DataModule1.FDQuerySummary.SQL.Clear;
DataModule1.FDQuerySummary.SQL.Add('SELECT reg_date, count(patient_id) as patients FROM visit_details_q_and_a GROUP BY reg_date ORDER BY 1 DESC ');
DataModule1.FDQuerySummary.Open();

end;

procedure TfrmQuestionnaires.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
Var
    grid : TDBGrid;
    row : Integer;
begin
   grid := sender as TDBGrid;

   row := grid.DataSource.DataSet.RecNo;

   if Odd(row) then
   begin
     grid.Canvas.Brush.Color := clSkyBlue;
   end
   else
   begin
    grid.Canvas.Brush.Color := clWhite;
   end;

   grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmQuestionnaires.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
Var
    grid : TDBGrid;
    row : Integer;
begin
   grid := sender as TDBGrid;

   row := grid.DataSource.DataSet.RecNo;

   if Odd(row) then
   begin
     grid.Canvas.Brush.Color := clSkyBlue;
   end
   else
   begin
    grid.Canvas.Brush.Color := clWhite;
   end;

   grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmQuestionnaires.FormActivate(Sender: TObject);
begin
DataModule1.FDQueryCount.SQL.Clear;
DataModule1.FDQueryCount.SQL.Add('SELECT count(patient_id) as total FROM visit_details_q_and_a ');
DataModule1.FDQueryCount.SQL.Add('WHERE reg_date = now()::date');
DataModule1.FDQueryCount.Open();

lblCount.Caption := 'Sent Today: ' + IntToStr(DataModule1.FDQueryCounttotal.value);

DataModule1.FDQueryCount.SQL.Clear;
DataModule1.FDQueryCount.SQL.Add('SELECT count(patient_id) as total FROM visit_details_q_and_a ');
DataModule1.FDQueryCount.SQL.Add('WHERE date_part(:month,reg_date) = date_part(:month,now())');
DataModule1.FDQueryCount.params.paramByName('month').value := 'month';
DataModule1.FDQueryCount.Open();

lblThisMonth.Caption := 'Sent This Month: ' + IntToStr(DataModule1.FDQueryCounttotal.value);


DataModule1.FDQueryCount.SQL.Clear;
DataModule1.FDQueryCount.SQL.Add('SELECT count(patient_id) as total FROM visit_details_q_and_a ');
DataModule1.FDQueryCount.Open();

lblTotalSent.Caption := 'Total Sent Since Inception on 10-02-2022: ' + IntToStr(DataModule1.FDQueryCounttotal.value);

DataModule1.FDQuerySummary.SQL.Clear;
DataModule1.FDQuerySummary.SQL.Add('SELECT reg_date, count(patient_id) as patients FROM visit_details_q_and_a GROUP BY reg_date ORDER BY 1 DESC ');
DataModule1.FDQuerySummary.Open();




end;

procedure TfrmQuestionnaires.Timer1Timer(Sender: TObject);
begin
DataModule1.FDQueryCount.SQL.Clear;
DataModule1.FDQueryCount.SQL.Add('SELECT count(patient_id) as total FROM visit_details_q_and_a ');
DataModule1.FDQueryCount.SQL.Add('WHERE reg_date = now()::date');
DataModule1.FDQueryCount.Open();

lblCount.Caption := 'Sent Today: ' + IntToStr(DataModule1.FDQueryCounttotal.value);

DataModule1.FDQueryCount.SQL.Clear;
DataModule1.FDQueryCount.SQL.Add('SELECT count(patient_id) as total FROM visit_details_q_and_a ');
DataModule1.FDQueryCount.SQL.Add('WHERE date_part(:month,reg_date) = date_part(:month,now()) and date_part(:year,reg_date) = date_part(:year,now())');
DataModule1.FDQueryCount.params.paramByName('month').value := 'month';
DataModule1.FDQueryCount.params.paramByName('year').value := 'year';
DataModule1.FDQueryCount.Open();

lblThisMonth.Caption := 'Sent This Month: ' + IntToStr(DataModule1.FDQueryCounttotal.value);


DataModule1.FDQueryCount.SQL.Clear;
DataModule1.FDQueryCount.SQL.Add('SELECT count(patient_id) as total FROM visit_details_q_and_a ');
DataModule1.FDQueryCount.Open();

lblTotalSent.Caption := 'Total Sent Since Inception on 10-02-2022: ' + IntToStr(DataModule1.FDQueryCounttotal.value);

DataModule1.FDQuerySummary.SQL.Clear;
DataModule1.FDQuerySummary.SQL.Add('SELECT reg_date, count(patient_id) as patients FROM visit_details_q_and_a GROUP BY reg_date ORDER BY 1 DESC ');
DataModule1.FDQuerySummary.Open();


end;

procedure TfrmQuestionnaires.txtSearchChange(Sender: TObject);
begin

DataModule1.FDQueryMessages.SQL.Clear;
DataModule1.FDQueryMessages.SQL.Add('SELECT destinationAddr,messageContent,dateCreated FROM feedback_view WHERE destinationAddr LIKE :ad');
DataModule1.FDQueryMessages.Params.ParamByName('ad').Value := '%' + txtSearch.Text + '%';
DataModule1.FDQueryMessages.Open()

end;

end.
