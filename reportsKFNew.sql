DECLARE
  PROCEDURE ins_record(v_id_report       IN NUMBER,
                       v_report_name     IN VARCHAR2,
                       v_report_file     IN VARCHAR2,
                       v_final_file_name IN VARCHAR2,
                       v_template_format IN NUMBER,
                       v_store_proc      IN VARCHAR2,
                       v_shown_in_crm    IN NUMBER) IS
  
  BEGIN
    INSERT INTO TRANSIT2.REPORTS
      (id_report,
       report_name,
       report_file,
       id_type,
       id_group,
       id_lang,
       can_fax,
       can_mail,
       can_print,
       can_export,
       need_restore,
       final_file_name,
       template_format,
       store_proc,
       shown_in_crm)
    VALUES
      (v_id_report,
       v_report_name,
       v_report_file,
       0,
       9,
       'C5A1166FC78546BD86B28CC92314B052',
       0,
       0,
       0,
       0,
       0,
       v_final_file_name,
       v_template_format,
       v_store_proc,
       v_shown_in_crm);
  EXCEPTION
    WHEN dup_val_on_index THEN
      UPDATE reports
      SET    report_name     = v_report_name,
             report_file     = v_report_file,
             final_file_name = v_final_file_name,
             template_format = v_template_format,
             store_proc      = v_store_proc,
             shown_in_crm    = v_shown_in_crm
      WHERE  id_report = v_id_report;
  END;
BEGIN
  ins_record(10132,
             'Приложение E2E акция цена стелы на РН на АИ-95',
             '\resources\docx\E2E\attachment e2e promotion price stela rn for ai-95.docx',
             'attachment e2e promotion price stela rn for ai-95',
             2,
             '',
             0);

END;
COMMIT;
/

