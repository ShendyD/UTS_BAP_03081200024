create view vJlhMhsKrs as
select
    `MHS`.`StudentID` AS `StudentID`,
    `MHS`.`Nama` AS `Nama`,
    count(`krs`.`krs`.`StudentID`) AS `JLHKRS`
from (
        `krs`.`mahasiswa` `MHS`
        join `krs`.`krs` on(
            `MHS`.`StudentID` = `krs`.`krs`.`StudentID`
        )
    )
group by
    `MHS`.`StudentID`,
    `MHS`.`Nama`