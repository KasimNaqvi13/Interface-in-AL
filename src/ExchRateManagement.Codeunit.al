codeunit 50100 "Demo Exchange Rate Management"
{
    procedure Convert(Amount: Decimal; FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]) Result: Decimal
    var
        Converter: Interface "Demo IConverter";
    begin
        CheckPermission(UserId, FromCurrencyCode, ToCurrencyCode);

        GetConverter(Converter);
        Result := Converter.Convert(Amount, FromCurrencyCode, ToCurrencyCode);

        Log(UserId, FromCurrencyCode, ToCurrencyCode, Amount, Result);
    end;

    local procedure GetConverter(var Converter: Interface "Demo IConverter")
    var
        Setup: Record "Demo Currency Exchange Setup";
    begin
        Setup.Get();
        Converter := Setup."Currency Converter";
    end;

    local procedure CheckPermission(UserID: Text[50]; FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10])
    var
        Permission: Codeunit "Demo Curr. Exch. Permiss. Mgt.";
        ErrorNotAllowed: Label 'Currency exchange is not allowed for %1 from %2 to %3.';
    begin
        if not Permission.CanConvert(UserId, FromCurrencyCode, ToCurrencyCode) then
            Error(ErrorNotAllowed, UserId, FromCurrencyCode, ToCurrencyCode);
    end;

    local procedure Log(UserID: Text[50]; FromCurrencyCode: Code[10]; ToCurrencyCode: Code[10]; FromAmount: Decimal; ToAmount: Decimal)
    var
        Log: Codeunit "Demo Currency Exchange Log";
    begin
        Log.Log(UserId, FromCurrencyCode, ToCurrencyCode, FromAmount, ToAmount);
    end;
}
