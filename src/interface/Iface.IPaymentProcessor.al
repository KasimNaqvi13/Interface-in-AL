interface IPaymentProcessor
{
    procedure ProcessPayment(amount: Decimal; var paymentId: Code[100]): Boolean;
    procedure RefundPayment(paymentId: Code[100]; amount: Decimal): Boolean;
    procedure CheckPaymentStatus(paymentId: Code[100]): Text[100];
}
