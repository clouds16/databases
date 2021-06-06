use MyGuitarShop


select
CardNumber,
len(CardNumber) as CardNumberLegnth,
right(CardNumber, 4) as LastFourDigits,
'XXXX-XXXX-XXXX-' + right(CardNumber, 4) as FormattedNumber
from Orders

