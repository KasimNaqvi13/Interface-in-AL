codeunit 60005 PaymentLogger
{
    procedure LogInfo(message: Text[100])
    begin
        // Implementation for logging informational messages
        Message('INFO: %1', message);
    end;

    procedure LogError(message: Text[100])
    begin
        // Implementation for logging error messages
        Message('ERROR: %1', message);
    end;
}
