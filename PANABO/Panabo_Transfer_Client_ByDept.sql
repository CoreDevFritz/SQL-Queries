SELECT
    ac.AccessFName AS `Processed By`,
    CONCAT_WS(', ', cl.Lname, cl.Fname) AS `Member Name`,
    actv.DateTimeAdded AS `Date Modified`,
    actv.FromData AS `Origin Branch`,
    actv.ToData AS `Transfer To Branch`
FROM
    actvtlog AS actv
    INNER JOIN client AS cl ON cl.ClientID = actv.ClientID
    INNER JOIN access AS ac ON ac.AccessID = actv.UserID
    INNER JOIN dept AS d ON actv.FromData = d.DeptDesc
WHERE
    actv.ActvtListID = 21
    AND d.DeptID = <<PROMPTNUMBER- BRANCH NUMBER: >>
ORDER BY
    actv.DateTimeAdded DESC;