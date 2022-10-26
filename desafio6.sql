SELECT MIN(accounts.price) AS faturamento_minimo,
MAX(accounts.price) AS faturamento_maximo,
ROUND(AVG(accounts.price), 2) AS faturamento_medio,
SUM(accounts.price) AS faturamento_total
FROM SpotifyClone.account as accounts
INNER JOIN SpotifyClone.user AS users
ON accounts.account_id = users.account_id; 