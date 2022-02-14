object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 283
  Width = 445
  object FDConnectionMySQL: TFDConnection
    Params.Strings = (
      'Database=sms'
      'User_Name=root'
      'Password=root'
      'Server=172.16.0.4'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 16
  end
  object FDQueryCount: TFDQuery
    Connection = FDConnectionPostgreSQL
    SQL.Strings = (
      
        'SELECT count(patient_id)as total FROM visit_details_q_and_a WHER' +
        'E reg_date = now()::date')
    Left = 160
    Top = 120
    object FDQueryCounttotal: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'total'
      Origin = 'total'
      ReadOnly = True
    end
  end
  object FDQueryMessages: TFDQuery
    Active = True
    Connection = FDConnectionMySQL
    SQL.Strings = (
      
        'SELECT destinationAddr,messageContent,dateCreated FROM feedback_' +
        'view')
    Left = 152
    Top = 32
    object FDQueryMessagesdestinationAddr: TLargeintField
      DisplayLabel = 'MOBILE NO.'
      FieldName = 'destinationAddr'
      Origin = 'destinationAddr'
      Required = True
    end
    object FDQueryMessagesdateCreated: TDateTimeField
      AutoGenerateValue = arDefault
      DisplayLabel = 'DATE SENT'
      FieldName = 'dateCreated'
      Origin = 'dateCreated'
    end
  end
  object FDConnectionPostgreSQL: TFDConnection
    Params.Strings = (
      'Database=postgres'
      'User_Name=postgres'
      'Password=root'
      'Server=172.16.0.4'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 128
  end
  object FDQuerySummary: TFDQuery
    Active = True
    Connection = FDConnectionPostgreSQL
    SQL.Strings = (
      
        'SELECT reg_date, count(patient_id) as patients FROM visit_detail' +
        's_q_and_a GROUP BY reg_date ORDER BY 1 DESC')
    Left = 240
    Top = 136
    object FDQuerySummaryreg_date: TDateField
      DisplayLabel = 'DATE'
      FieldName = 'reg_date'
      Origin = 'reg_date'
    end
    object FDQuerySummarypatients: TLargeintField
      AutoGenerateValue = arDefault
      DisplayLabel = 'QUESTIONNAIRES SENT'
      FieldName = 'patients'
      Origin = 'patients'
      ReadOnly = True
    end
  end
end
