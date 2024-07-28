codeunit 60004 PaymentManager
{
    procedure ManagePayments()
    var
        paymentProcessor: Interface IPaymentProcessor;
        paymentId: Code[20];
        success: Boolean;
        amount: Decimal;
        status: Text[30];
        creditCardPayment: Codeunit CreditCardPayment;
        bankTransferPayment: Codeunit BankTransferPayment;
        digitalWalletPayment: Codeunit DigitalWalletPayment;
        PaymentLogger: Codeunit PaymentLogger;
    begin
        // Process Credit Card Payment
        paymentProcessor := creditCardPayment;
        amount := 100.00;
        if paymentProcessor.ProcessPayment(amount, paymentId) then begin
            PaymentLogger.LogInfo('Credit Card Payment processed successfully. Payment ID: ' + paymentId);
        end else begin
            PaymentLogger.LogError('Credit Card Payment processing failed for amount: ' + Format(amount));
        end;

        if paymentProcessor.RefundPayment(paymentId, 50.00) then begin
            PaymentLogger.LogInfo('Credit Card Payment refunded successfully.');
        end else begin
            PaymentLogger.LogError('Credit Card Payment refund failed for amount: ' + Format(50.00));
        end;

        status := paymentProcessor.CheckPaymentStatus(paymentId);
        Message('Credit Card Payment Status: %1', status);

        // Process Bank Transfer Payment
        paymentProcessor := bankTransferPayment;
        amount := 200.00;
        if paymentProcessor.ProcessPayment(amount, paymentId) then begin
            PaymentLogger.LogInfo('Bank Transfer Payment processed successfully. Payment ID: ' + paymentId);
        end else begin
            PaymentLogger.LogError('Bank Transfer Payment processing failed for amount: ' + Format(amount));
        end;

        if paymentProcessor.RefundPayment(paymentId, 100.00) then begin
            PaymentLogger.LogInfo('Bank Transfer Payment refunded successfully.');
        end else begin
            PaymentLogger.LogError('Bank Transfer Payment refund failed for amount: ' + Format(100.00));
        end;

        status := paymentProcessor.CheckPaymentStatus(paymentId);
        Message('Bank Transfer Payment Status: %1', status);

        // Process Digital Wallet Payment
        paymentProcessor := digitalWalletPayment;
        amount := 150.00;
        if paymentProcessor.ProcessPayment(amount, paymentId) then begin
            PaymentLogger.LogInfo('Digital Wallet Payment processed successfully. Payment ID: ' + paymentId);
        end else begin
            PaymentLogger.LogError('Digital Wallet Payment processing failed for amount: ' + Format(amount));
        end;

        if paymentProcessor.RefundPayment(paymentId, 75.00) then begin
            PaymentLogger.LogInfo('Digital Wallet Payment refunded successfully.');
        end else begin
            PaymentLogger.LogError('Digital Wallet Payment refund failed for amount: ' + Format(75.00));
        end;

        status := paymentProcessor.CheckPaymentStatus(paymentId);
        Message('Digital Wallet Payment Status: %1', status);
    end;
}
