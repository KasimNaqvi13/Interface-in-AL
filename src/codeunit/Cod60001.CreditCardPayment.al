codeunit 60001 CreditCardPayment implements IPaymentProcessor
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
        logger.LogInfo('Processing credit card payment of ' + Format(amount) + '. Payment ID: ' + paymentId);
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
        logger.LogInfo('Refunding credit card payment of ' + Format(amount) + '. Payment ID: ' + paymentId);
        exit(success);
    end;

    procedure CheckPaymentStatus(paymentId: Code[100]): Text[100]
    var
        status: Text[30];
        logger: Codeunit PaymentLogger;
    begin
        // Simulate checking payment status
        status := 'Completed';
        logger.LogInfo('Checking status for credit card payment ID ' + paymentId + ': ' + status);
        exit(status);
    end;
}
