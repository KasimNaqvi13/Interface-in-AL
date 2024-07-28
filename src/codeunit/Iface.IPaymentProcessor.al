interface IPaymentProcessor
{
    procedure ProcessPayment(amount: Decimal; var paymentId: Code[20]): Boolean;
    procedure RefundPayment(paymentId: Code[20]; amount: Decimal): Boolean;
    procedure CheckPaymentStatus(paymentId: Code[20]): Text[30];
}
