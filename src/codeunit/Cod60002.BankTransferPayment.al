codeunit 60002 BankTransferPayment implements IPaymentProcessor
{
    procedure ProcessPayment(amount: Decimal; var paymentId: Code[100]): Boolean
    var
        success: Boolean;
        logger: Codeunit PaymentLogger;
    begin
        // Validation
        if amount <= 0 then begin
            logger.LogError('Invalid payment amount.');
            exit(false);
        end;

        // Simulate processing payment
        success := true;
        paymentId := Format(CreateGuid());
        logger.LogInfo('Processing bank transfer payment of ' + Format(amount) + '. Payment ID: ' + paymentId);
        exit(success);
    end;

    procedure RefundPayment(paymentId: Code[100]; amount: Decimal): Boolean
    var
        success: Boolean;
        logger: Codeunit PaymentLogger;
    begin
        // Validation
        if amount <= 0 then begin
            logger.LogError('Invalid refund amount.');
            exit(false);
        end;

        // Simulate refunding payment
        success := true;
        logger.LogInfo('Refunding bank transfer payment of ' + Format(amount) + '. Payment ID: ' + paymentId);
        exit(success);
    end;

    procedure CheckPaymentStatus(paymentId: Code[100]): Text[100]
    var
        status: Text[30];
        logger: Codeunit PaymentLogger;
    begin
        // Simulate checking payment status
        status := 'Pending';
        logger.LogInfo('Checking status for bank transfer payment ID ' + paymentId + ': ' + status);
        exit(status);
    end;
}
