codeunit 60004 PaymentManager
{
    procedure ManagePayments()
    var
        creditCardProcessor: Codeunit "CreditCardPayment";
        bankTransferProcessor: Codeunit "BankTransferPayment";
        digitalWalletProcessor: Codeunit "DigitalWalletPayment";
        paymentId: Code[20];
    begin
        // Example usage with a credit card payment
        if creditCardProcessor.ProcessPayment(100.00, paymentId) then
            Message('Credit Card Payment processed successfully. Payment ID: %1', paymentId)
        else
            Message('Credit Card Payment processing failed.');

        if creditCardProcessor.RefundPayment(paymentId, 50.00) then
            Message('Credit Card Payment refunded successfully.')
        else
            Message('Credit Card Payment refund failed.');

        Message('Credit Card Payment Status: %1', creditCardProcessor.CheckPaymentStatus(paymentId));

        // Example usage with a bank transfer payment
        if bankTransferProcessor.ProcessPayment(200.00, paymentId) then
            Message('Bank Transfer Payment processed successfully. Payment ID: %1', paymentId)
        else
            Message('Bank Transfer Payment processing failed.');

        if bankTransferProcessor.RefundPayment(paymentId, 100.00) then
            Message('Bank Transfer Payment refunded successfully.')
        else
            Message('Bank Transfer Payment refund failed.');

        Message('Bank Transfer Payment Status: %1', bankTransferProcessor.CheckPaymentStatus(paymentId));

        // Example usage with a digital wallet payment
        if digitalWalletProcessor.ProcessPayment(150.00, paymentId) then
            Message('Digital Wallet Payment processed successfully. Payment ID: %1', paymentId)
        else
            Message('Digital Wallet Payment processing failed.');

        if digitalWalletProcessor.RefundPayment(paymentId, 75.00) then
            Message('Digital Wallet Payment refunded successfully.')
        else
            Message('Digital Wallet Payment refund failed.');

        Message('Digital Wallet Payment Status: %1', digitalWalletProcessor.CheckPaymentStatus(paymentId));
    end;
}
