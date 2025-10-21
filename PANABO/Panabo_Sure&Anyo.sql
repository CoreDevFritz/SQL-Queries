SELECT 
    o.CLIENTID AS 'ClientID',
    c.LName AS LastName,
    c.FName AS FirstName,
    c.MName AS MiddleName,
    g.GenderDesc AS Gender,
    c.ResAddStreet,
    c.ResAddBarangay,
    c.ResAddCity,
    c.ResAddProvince,
    o.PrincipalAmt as 'Amount of Loan',
    o.TR_DATE as 'Date Granted',
    o.MaturityDate as 'Date Due',
    o.PaymentMode as 'Mode of Payment',
    (SELECT SUM(AMT)*-1 from sldtl where SL_CLIENTID=o.CLIENTID and REF_NO = o.REF_NO and TR_CODE = 201 AND MONTH(TR_DATE) = MONTH(o.CUTDATE) AND YEAR(TR_DATE) = YEAR(o.CUTDATE)) as 'Amount Collected (for the month)',
    o.PrincipalBal as 'Outstanding Balance',
    (o.PrinDue + o.IntDue + o.PenDue) AS 'Amount Past Due'
FROM <<OTN>> o
JOIN Client c 
    ON c.ClientID = o.ClientID
LEFT JOIN Gender g
    ON g.GenderID= c.Gender;