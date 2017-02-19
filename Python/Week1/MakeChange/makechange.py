currency_values = [
    ('half-dollars', 50),
    ('pennies', 1),
    ('dollars', 100),
    ('quarters', 25),
    ('dimes', 10),
    ('nickels', 5)
]

# sorts the currency list so it doesnt need to be entered in order above
sorted_currency = sorted(currency_values, key=lambda name:name[1], reverse=True)

def change(cents):
    coins = {}
    for cur_type, value in sorted_currency:
        num_cur = 0
        while cents >= value:
            num_cur += 1
            cents -= value
        coins[cur_type] = num_cur

    return coins

print change(387)
