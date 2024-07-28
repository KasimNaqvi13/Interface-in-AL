page 60000 PaymentManagerPage
{
    PageType = Card;
    SourceTable = Customer; // Use any existing table or create a dummy table
    ApplicationArea = All;
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(Group)
            {
                Caption = 'Payment Manager';
                field(EmptyField; Rec."No.") // Dummy field to comply with Page Type = Card
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ManagePayments)
            {
                Caption = 'Manage Payments';
                Image = Payment;
                trigger OnAction()
                var
                    paymentManager: Codeunit PaymentManager;
                begin
                    paymentManager.ManagePayments();
                    Message('Payments have been managed.');
                end;
            }
        }
    }
}
